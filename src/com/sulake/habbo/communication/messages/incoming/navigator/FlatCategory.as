package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_336:Boolean;
      
      private var var_1771:int;
      
      private var var_1904:String;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1771 = param1.readInteger();
         this.var_1904 = param1.readString();
         this.var_336 = param1.readBoolean();
      }
      
      public function get visible() : Boolean
      {
         return this.var_336;
      }
      
      public function get nodeName() : String
      {
         return this.var_1904;
      }
      
      public function get nodeId() : int
      {
         return this.var_1771;
      }
   }
}
