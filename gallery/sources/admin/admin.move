module gallery::admin;

use sui::sui::SUI;
use sui::balance::{Self, Balance, zero};
use std::vector::{empty};
use sui::coin::{Self, Coin};

public struct AdminCap has key{
    id: UID,
}

/*
estrutura da galeria
identificacao, taxa para ter acesso, lista de quem tem acesso
valor das taxas coletadas
*/
public struct GalleryData has key{
    id: UID,
    fee: u64,
    addresses: vector<address>,
    balance: Balance<SUI>,
}

/*
construtor da galeria
*/
fun init(ctx: &mut TxContext){
    let admin_cap = AdminCap{
        id: object:: new(ctx),
    };
    transfer::transfer(admin_cap,tx_context::sender(ctx));

    let gallery = GalleryData{
        id: object::new(ctx),
        fee: 100000000,
        addresses: empty(),
        balance: zero<SUI>(),
    };

    transfer::share_object(gallery);
}

/*
adicionando acesso ao endereço que pagou a galleria
*/
fun add_address(gallery: &mut GalleryData, address: address){
    gallery.addresses.push_back(address);
}

/*
retirada de dinheiro da galeria(admin)
*/
public fun withdraw_balance(gallery: &mut GalleryData, _cap: &AdminCap, amount: u64, ctx: &mut TxContext): Coin<SUI>{
    coin::take<SUI>(&mut gallery.balance, amount, ctx)
}

/*
tranferindo dinheiro para a galeria e liberando acesso de quem pagou
*/
public (package) fun handle_payment(gallery: &mut GalleryData, mut payment: Coin<SUI>, ctx: &mut TxContext){
    coin::put<SUI>(&mut gallery.balance, payment);
    add_address(gallery, tx_context::sender(ctx));

}

/*
getter da fee
*/
public (package) fun get_fee(gallery: &mut GalleryData):u64{
    gallery.fee
}