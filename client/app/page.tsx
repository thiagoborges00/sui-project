"use client";
// import Image from "next/image";
import { Button } from "@/components/ui/button";
import { useRouter } from "next/navigation";

export default function Home() {

  const router = useRouter();

  const handleOwnerLogin = () =>{
    router.push("/dono");
  }

  const handleUserLogin= () =>{
    router.push("/usuario");
  }

  return (
    <div className="flex flex-row h-screen justify-center gap-2 items-center ">
      <Button onClick={handleOwnerLogin}>
        Entrar como dono
      </Button>
      <Button onClick={handleUserLogin}>
        Entrar como usuario
      </Button>

    </div>
  
  );
}
