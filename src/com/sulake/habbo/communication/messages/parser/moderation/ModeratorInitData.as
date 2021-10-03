package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1311:Array;
      
      private var var_2357:Boolean;
      
      private var var_1310:Array;
      
      private var var_2354:Boolean;
      
      private var var_2356:Boolean;
      
      private var var_2358:Boolean;
      
      private var _issues:Array;
      
      private var var_2359:Boolean;
      
      private var var_2361:Boolean;
      
      private var var_1066:Array;
      
      private var var_2360:Boolean;
      
      private var var_2355:Boolean;
      
      public function ModeratorInitData(param1:IMessageDataWrapper)
      {
         super();
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         this._issues = [];
         this.var_1310 = [];
         this.var_1311 = [];
         this.var_1066 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(_loc2_.parse(param1))
            {
               this._issues.push(_loc2_.issueData);
            }
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_1310.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_1066.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         this.var_2359 = param1.readBoolean();
         this.var_2358 = param1.readBoolean();
         this.var_2354 = param1.readBoolean();
         this.var_2356 = param1.readBoolean();
         this.var_2355 = param1.readBoolean();
         this.var_2361 = param1.readBoolean();
         this.var_2357 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_1311.push(param1.readString());
            _loc4_++;
         }
         this.var_2360 = param1.readBoolean();
      }
      
      public function get banPermission() : Boolean
      {
         return this.var_2355;
      }
      
      public function get messageTemplates() : Array
      {
         return this.var_1310;
      }
      
      public function get alertPermission() : Boolean
      {
         return this.var_2354;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return this.var_2357;
      }
      
      public function get cfhPermission() : Boolean
      {
         return this.var_2359;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1310 = null;
         this.var_1311 = null;
         this._issues = null;
         for each(_loc1_ in this.var_1066)
         {
            _loc1_.dispose();
         }
         this.var_1066 = null;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return this.var_1311;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return this.var_2361;
      }
      
      public function get kickPermission() : Boolean
      {
         return this.var_2356;
      }
      
      public function get offenceCategories() : Array
      {
         return this.var_1066;
      }
      
      public function get issues() : Array
      {
         return this._issues;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return this.var_2360;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return this.var_2358;
      }
   }
}
