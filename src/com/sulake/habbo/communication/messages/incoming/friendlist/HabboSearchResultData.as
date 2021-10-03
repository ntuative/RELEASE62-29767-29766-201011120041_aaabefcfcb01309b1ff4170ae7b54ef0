package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_1879:Boolean;
      
      private var var_1878:int;
      
      private var var_1880:Boolean;
      
      private var var_1413:String;
      
      private var var_1412:String;
      
      private var var_1876:int;
      
      private var var_1877:String;
      
      private var var_1874:String;
      
      private var var_1875:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1876 = param1.readInteger();
         this.var_1413 = param1.readString();
         this.var_1877 = param1.readString();
         this.var_1879 = param1.readBoolean();
         this.var_1880 = param1.readBoolean();
         param1.readString();
         this.var_1878 = param1.readInteger();
         this.var_1875 = param1.readString();
         this.var_1874 = param1.readString();
         this.var_1412 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1412;
      }
      
      public function get avatarName() : String
      {
         return this.var_1413;
      }
      
      public function get avatarId() : int
      {
         return this.var_1876;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_1879;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_1874;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1875;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_1880;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1877;
      }
      
      public function get avatarGender() : int
      {
         return this.var_1878;
      }
   }
}
