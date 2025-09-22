import { useCurrentAccount, useSuiClient } from "@mysten/dapp-kit"

export const useGalleryData = () => {

    const currentAccount = useCurrentAccount();

    const client = useSuiClient();
    
    const galleryData = async ()=>{
        if (!currentAccount) return [];
        const gallery: any = await client.getObject({
            id:'0xada4e717c62645d51b4cca57b11d9f1bf343b595143c027ab6afbcaec3199c05',
            options: {
                showContent: true,
                showOwner: true,
            }
        });

        return { ...gallery.data.content.fields};
    };
    return {
        galleryData
    };

};