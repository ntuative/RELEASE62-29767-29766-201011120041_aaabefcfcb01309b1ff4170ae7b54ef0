package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1187:BigInteger;
      
      private var var_810:BigInteger;
      
      private var var_1452:BigInteger;
      
      private var var_1451:BigInteger;
      
      private var var_1969:BigInteger;
      
      private var var_1942:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1187 = param1;
         this.var_1452 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_1969.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1451 = new BigInteger();
         this.var_1451.fromRadix(param1,param2);
         this.var_1969 = this.var_1451.modPow(this.var_810,this.var_1187);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_1942.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1187.toString() + ",generator: " + this.var_1452.toString() + ",secret: " + param1);
         this.var_810 = new BigInteger();
         this.var_810.fromRadix(param1,param2);
         this.var_1942 = this.var_1452.modPow(this.var_810,this.var_1187);
         return true;
      }
   }
}
