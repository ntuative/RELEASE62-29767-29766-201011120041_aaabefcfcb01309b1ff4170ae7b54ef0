package com.sulake.habbo.help.register
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.habbo.communication.messages.outgoing.help.SendRegistrationDataComposer;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class RegistrationUI
   {
       
      
      private var var_166:HabboHelp;
      
      private var var_881:RegistrationView;
      
      public function RegistrationUI(param1:HabboHelp)
      {
         super();
         this.var_166 = param1;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_166.assets;
      }
      
      public function sendRegistrationEmail(param1:String, param2:String, param3:Boolean) : void
      {
         this.var_166.sendMessage(new SendRegistrationDataComposer(param1,param2,param3));
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_166.localization;
      }
      
      public function showRegistrationView() : void
      {
         if(!this.var_881)
         {
            this.var_881 = new RegistrationView(this);
         }
         this.var_881.showMainView();
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this.var_166.windowManager;
      }
      
      public function get myName() : String
      {
         return this.var_166.ownUserName;
      }
      
      public function dispose() : void
      {
         this.var_166 = null;
         if(this.var_881)
         {
            this.var_881.dispose();
            this.var_881 = null;
         }
      }
   }
}
