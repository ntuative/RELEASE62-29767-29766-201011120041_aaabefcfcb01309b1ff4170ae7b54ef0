package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2310:String;
      
      private var var_898:String;
      
      private var var_1777:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1777 = param1.readInteger();
         this.var_2310 = param1.readString();
         this.var_898 = param1.readString();
      }
      
      public function get gender() : String
      {
         return this.var_898;
      }
      
      public function get figureString() : String
      {
         return this.var_2310;
      }
      
      public function get slotId() : int
      {
         return this.var_1777;
      }
   }
}
