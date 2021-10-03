package com.sulake.core.runtime
{
   import com.sulake.core.assets.AssetLibrary;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.runtime.events.LockEvent;
   import com.sulake.core.runtime.exceptions.ComponentDisposedException;
   import com.sulake.core.runtime.exceptions.InvalidComponentException;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.utils.getQualifiedClassName;
   
   public class Component implements IUnknown
   {
      
      public static const const_1028:uint = 4;
      
      public static const COMPONENT_EVENT_ERROR:String = "COMPONENT_EVENT_ERROR";
      
      public static const COMPONENT_FLAG_NULL:uint = 0;
      
      public static const const_1550:uint = 1;
      
      public static const COMPONENT_EVENT_DEBUG:String = "COMPONENT_EVENT_DEBUG";
      
      protected static const INTERNAL_EVENT_UNLOCKED:String = "_INTERNAL_EVENT_UNLOCKED";
      
      public static const COMPONENT_EVENT_WARNING:String = "COMPONENT_EVENT_WARNING";
      
      public static const COMPONENT_EVENT_RUNNING:String = "COMPONENT_EVENT_RUNNING";
      
      public static const COMPONENT_EVENT_DISPOSING:String = "COMPONENT_EVENT_DISPOSING";
      
      public static const COMPONENT_FLAG_CONTEXT:uint = 2;
       
      
      private var var_1377:uint;
      
      private var _disposed:Boolean = false;
      
      protected var var_1139:String = "";
      
      private var var_445:InterfaceStructList;
      
      protected var var_1825:String = "";
      
      private var _assets:IAssetLibrary;
      
      protected var var_682:uint = 0;
      
      private var var_816:Boolean = false;
      
      protected var var_1550:String = "";
      
      private var var_17:IContext = null;
      
      private var _events:EventDispatcher;
      
      public function Component(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super();
         this.var_1377 = param2;
         this.var_445 = new InterfaceStructList();
         this._events = new EventDispatcher();
         this.var_17 = param1;
         this._assets = param3 != null ? param3 : new AssetLibrary("_internal_asset_library");
         if(this.var_17 == null)
         {
            throw new InvalidComponentException("IContext not provided to Component\'s constructor!");
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return this._assets;
      }
      
      public function release(param1:IID) : uint
      {
         if(this._disposed)
         {
            return 0;
         }
         var _loc2_:InterfaceStruct = this.var_445.getStructByInterface(param1);
         if(_loc2_ == null)
         {
            this.var_1139 = "Attempting to release unknown interface:" + param1 + "!";
            throw new Error(this.var_1139);
         }
         var _loc3_:uint = _loc2_.release();
         if(this.var_1377 & const_1028)
         {
            if(_loc3_ == 0)
            {
               if(this.var_445.getTotalReferenceCount() == 0)
               {
                  this.var_17.detachComponent(this);
                  this.dispose();
               }
            }
         }
         return _loc3_;
      }
      
      public function get locked() : Boolean
      {
         return this.var_816;
      }
      
      public function toXMLString(param1:uint = 0) : String
      {
         var _loc6_:* = null;
         var _loc2_:* = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1)
         {
            _loc2_ += "\t";
            _loc3_++;
         }
         var _loc4_:String = getQualifiedClassName(this);
         var _loc5_:String = "";
         _loc5_ += _loc2_ + "<component class=\"" + _loc4_ + "\">\n";
         var _loc7_:uint = this.var_445.length;
         var _loc8_:int = 0;
         while(_loc8_ < _loc7_)
         {
            _loc6_ = this.var_445.getStructByIndex(_loc8_);
            _loc5_ += _loc2_ + "\t<interface iid=\"" + _loc6_.iis + "\" refs=\"" + _loc6_.references + "\"/>\n";
            _loc8_++;
         }
         return _loc5_ + (_loc2_ + "</component>\n");
      }
      
      public function removeUpdateReceiver(param1:IUpdateReceiver) : void
      {
         this.var_17.removeUpdateReceiver(param1);
      }
      
      public function get events() : IEventDispatcher
      {
         return this._events;
      }
      
      public function registerUpdateReceiver(param1:IUpdateReceiver, param2:uint) : void
      {
         this.var_17.registerUpdateReceiver(param1,param2);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            Logger.log("Disposing component " + getQualifiedClassName(this));
            this._events.dispatchEvent(new Event(Component.COMPONENT_EVENT_DISPOSING));
            this._events = null;
            this.var_445.dispose();
            this.var_445 = null;
            this._assets.dispose();
            this._assets = null;
            this.var_17 = null;
            this.var_682 = 0;
            this._disposed = true;
         }
      }
      
      public function queueInterface(param1:IID, param2:Function = null) : IUnknown
      {
         var _loc3_:InterfaceStruct = this.var_445.getStructByInterface(param1);
         if(_loc3_ == null)
         {
            return this.var_17.queueInterface(param1,param2);
         }
         if(this._disposed)
         {
            throw new ComponentDisposedException("Failed to queue interface trough disposed Component \"" + getQualifiedClassName(this) + "\"!");
         }
         if(this.var_816)
         {
            return null;
         }
         _loc3_.reserve();
         var _loc4_:IUnknown = _loc3_.unknown as IUnknown;
         if(param2 != null)
         {
            param2(param1,_loc4_);
         }
         return _loc4_;
      }
      
      protected final function lock() : void
      {
         if(!this.var_816)
         {
            this.var_816 = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get iids() : InterfaceStructList
      {
         return this.var_445;
      }
      
      protected final function unlock() : void
      {
         if(this.var_816)
         {
            this.var_816 = false;
            this._events.dispatchEvent(new LockEvent(INTERNAL_EVENT_UNLOCKED,this));
         }
      }
      
      public function get context() : IContext
      {
         return this.var_17;
      }
      
      public function toString() : String
      {
         return "[component " + getQualifiedClassName(this) + " refs: " + this.var_682 + "]";
      }
   }
}
