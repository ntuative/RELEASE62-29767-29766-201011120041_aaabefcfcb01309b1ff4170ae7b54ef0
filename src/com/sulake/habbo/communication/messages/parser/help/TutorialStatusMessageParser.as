package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1266:Boolean;
      
      private var var_1018:Boolean;
      
      private var var_1265:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1266;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1018;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1265 = param1.readBoolean();
         this.var_1018 = param1.readBoolean();
         this.var_1266 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1265;
      }
      
      public function flush() : Boolean
      {
         this.var_1265 = false;
         this.var_1018 = false;
         this.var_1266 = false;
         return true;
      }
   }
}
