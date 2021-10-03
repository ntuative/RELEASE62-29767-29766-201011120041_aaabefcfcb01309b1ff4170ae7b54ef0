package com.sulake.habbo.moderation
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   
   public class UserInfoFrameCtrl implements IDisposable, TrackedWindow
   {
       
      
      private var var_922:UserInfoCtrl;
      
      private var _disposed:Boolean;
      
      private var _userId:int;
      
      private var _frame:IFrameWindow;
      
      private var var_46:ModerationManager;
      
      public function UserInfoFrameCtrl(param1:ModerationManager, param2:int)
      {
         super();
         this.var_46 = param1;
         this._userId = param2;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this._frame != null)
         {
            this._frame.destroy();
            this._frame = null;
         }
         if(this.var_922 != null)
         {
            this.var_922.dispose();
            this.var_922 = null;
         }
         this.var_46 = null;
      }
      
      public function getId() : String
      {
         return "" + this._userId;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function getType() : int
      {
         return WindowTracker.const_1464;
      }
      
      private function onClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.dispose();
      }
      
      public function show() : void
      {
         this._frame = IFrameWindow(this.var_46.getXmlWindow("user_info_frame"));
         this._frame.caption = "User Info";
         var _loc1_:IWindow = this._frame.findChildByTag("close");
         _loc1_.procedure = this.onClose;
         this.var_922 = new UserInfoCtrl(this._frame,this.var_46,"",true);
         this.var_922.load(this._frame.content,this._userId);
         this._frame.visible = true;
      }
      
      public function getFrame() : IFrameWindow
      {
         return this._frame;
      }
   }
}
