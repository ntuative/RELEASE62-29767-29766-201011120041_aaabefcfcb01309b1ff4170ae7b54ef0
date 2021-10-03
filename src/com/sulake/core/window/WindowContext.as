package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IMouseCursor;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseCursorControl;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static var var_334:IEventQueue;
      
      public static var var_1373:IMouseCursor;
      
      private static var stage:Stage;
      
      public static const const_1527:int = 1;
      
      private static var var_562:IEventProcessor;
      
      public static const const_1695:int = 0;
      
      public static const const_1575:int = 3;
      
      public static const const_424:uint = 0;
      
      private static var var_1622:uint = const_424;
      
      private static var var_133:IWindowRenderer;
      
      public static const const_340:int = 5;
      
      public static const const_1298:uint = 1;
      
      public static const const_1469:int = 4;
      
      public static const const_1724:int = 2;
       
      
      private var _disposed:Boolean = false;
      
      protected var var_2546:IInternalWindowServices;
      
      protected var var_2547:IWindowParser;
      
      protected var var_1139:Error;
      
      private var var_2270:Boolean = false;
      
      private var var_2271:IWindowContextStateListener;
      
      protected var var_1827:int = -1;
      
      private var _eventProcessorState:EventProcessorState;
      
      protected var var_128:IDesktopWindow;
      
      protected var var_2593:Boolean = true;
      
      protected var var_1379:SubstituteParentController;
      
      private var var_497:Boolean = false;
      
      protected var var_169:DisplayObjectContainer;
      
      private var _name:String;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_2545:IWindowFactory;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_133 = param2;
         this._localization = param4;
         this.var_169 = param5;
         this.var_2546 = new ServiceManager(this,param5);
         this.var_2545 = param3;
         this.var_2547 = new WindowParser(this);
         this.var_2271 = param7;
         if(!stage)
         {
            if(this.var_169 is Stage)
            {
               stage = this.var_169 as Stage;
            }
            else if(this.var_169.stage)
            {
               stage = this.var_169.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_128 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_169.addChild(this.var_128.getDisplayObject());
         this.var_169.doubleClickEnabled = true;
         this.var_169.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this._eventProcessorState = new EventProcessorState(var_133,this.var_128,this.var_128,null,this.var_2271);
         inputMode = const_424;
         this.var_1379 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1622;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_334)
         {
            if(var_334 is IDisposable)
            {
               IDisposable(var_334).dispose();
            }
         }
         if(var_562)
         {
            if(var_562 is IDisposable)
            {
               IDisposable(var_562).dispose();
            }
         }
         switch(value)
         {
            case const_424:
               var_334 = new MouseEventQueue(stage);
               var_562 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1298:
               var_334 = new TabletEventQueue(stage);
               var_562 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_424;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_128)
         {
            this.var_128 = null;
         }
         if(param1.state != WindowState.const_476)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:Class = Classes.getWindowClassByType(param3);
         if(_loc12_ == null)
         {
            this.handleError(WindowContext.const_1469,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1379;
            }
         }
         var _loc13_:IWindow = new _loc12_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_128,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc13_.caption = param2;
         }
         return _loc13_;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_2546;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2270 = true;
         var_133.update(param1);
         this.var_2270 = false;
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.var_169.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_169.removeChild(IGraphicContextHost(this.var_128).getGraphicContext(true) as DisplayObject);
            this.var_128.destroy();
            this.var_128 = null;
            this.var_1379.destroy();
            this.var_1379 = null;
            var_133 = null;
            this._disposed = true;
         }
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_2547;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_128 != null && !this.var_128.disposed)
         {
            if(this.var_169 is Stage)
            {
               this.var_128.width = Stage(this.var_169).stageWidth;
               this.var_128.height = Stage(this.var_169).stageHeight;
            }
            else
            {
               this.var_128.width = this.var_169.width;
               this.var_128.height = this.var_169.height;
            }
         }
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         var_133.addToRenderQueue(WindowController(param1),param2,param3);
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2545;
      }
      
      public function update(param1:uint) : void
      {
         this.var_497 = true;
         if(this.var_1139)
         {
            throw this.var_1139;
         }
         var_562.process(this._eventProcessorState,var_334);
         this.var_497 = false;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1139 = param2;
         this.var_1827 = param1;
         if(this.var_2593)
         {
            throw param2;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1139;
      }
      
      public function getMouseCursor() : IMouseCursor
      {
         if(var_1373 == null)
         {
            var_1373 = new MouseCursorControl(this.var_169);
         }
         return var_1373;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_1827;
      }
      
      public function flushError() : void
      {
         this.var_1139 = null;
         this.var_1827 = -1;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_128.findChildByName(param1);
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_128;
      }
   }
}
