package com.sulake.habbo.messenger.domain
{
   import com.sulake.habbo.messenger.HabboMessenger;
   
   public class ConversationsDeps implements IConversationsDeps
   {
       
      
      private var var_119:HabboMessenger;
      
      public function ConversationsDeps(param1:HabboMessenger)
      {
         super();
         this.var_119 = param1;
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         this.var_119.messengerView.addMsgToView(param1,param2);
      }
      
      public function createConversation(param1:int) : Conversation
      {
         return this.var_119.createConversation(param1);
      }
      
      public function getText(param1:String) : String
      {
         return this.var_119.getText(param1);
      }
      
      public function getTabCount() : int
      {
         return this.var_119.messengerView.getTabCount();
      }
      
      public function refresh(param1:Boolean) : void
      {
         this.var_119.messengerView.refresh();
      }
   }
}
