module gallery::acesso;
use gallery::admin::GalleryData;
use sui::coin::{Self, Coin};
use sui::sui::SUI;

public fun payAccess(gallery: &mut GalleryData, mut payment:Coin<SUI>, ctx: &mut TxContext){

    assert!(coin::value(&payment) >= gallery.get_fee(),1);
    let mut amount = coin::split<SUI>(&mut );
}