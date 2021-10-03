package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_226:String = "e";
      
      public static const const_78:String = "i";
      
      public static const const_85:String = "s";
       
      
      private var var_1212:String;
      
      private var var_1478:String;
      
      private var var_1476:int;
      
      private var var_2209:int;
      
      private var var_1211:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1478 = param1.readString();
         this.var_2209 = param1.readInteger();
         this.var_1212 = param1.readString();
         this.var_1211 = param1.readInteger();
         this.var_1476 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return this.var_1211;
      }
      
      public function get productType() : String
      {
         return this.var_1478;
      }
      
      public function get expiration() : int
      {
         return this.var_1476;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2209;
      }
      
      public function get extraParam() : String
      {
         return this.var_1212;
      }
   }
}
