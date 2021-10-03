package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.utils.IIterable;
   import com.sulake.core.window.utils.IIterator;
   import com.sulake.core.window.utils.Iterator;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class SelectorController extends InteractiveController implements ISelectorWindow, IIterable
   {
       
      
      protected var var_1831:Boolean = true;
      
      private var var_178:ISelectableWindow;
      
      public function SelectorController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function getSelectableAt(param1:int) : ISelectableWindow
      {
         return getChildAt(param1) as ISelectableWindow;
      }
      
      public function getSelectableIndex(param1:ISelectableWindow) : int
      {
         return getChildIndex(param1);
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         if(param2.type == WindowNotifyEvent.const_239)
         {
            if(param1 is ISelectableWindow)
            {
               this.setSelected(param1 as ISelectableWindow);
            }
         }
         return super.update(param1,param2);
      }
      
      public function removeSelectable(param1:ISelectableWindow) : ISelectableWindow
      {
         var _loc2_:int = getChildIndex(param1);
         if(_loc2_ > -1)
         {
            if(param1 == this.var_178)
            {
               if(this.numSelectables > 1)
               {
                  this.setSelected(this.getSelectableAt(_loc2_ == 0 ? 1 : 0));
               }
               else
               {
                  this.var_178 = null;
               }
            }
            return ISelectableWindow(removeChild(param1));
         }
         return null;
      }
      
      public function addSelectable(param1:ISelectableWindow) : ISelectableWindow
      {
         return ISelectableWindow(addChild(param1));
      }
      
      public function getSelected() : ISelectableWindow
      {
         return this.var_178 as ISelectableWindow;
      }
      
      public function getSelectableByID(param1:uint) : ISelectableWindow
      {
         return getChildByID(param1) as ISelectableWindow;
      }
      
      public function setSelected(param1:ISelectableWindow) : void
      {
         if(param1 != null)
         {
            if(param1 != this.var_178)
            {
               if(this.var_178 != null)
               {
                  this.var_178.unselect();
               }
               this.var_178 = param1;
               this.var_178.select();
               if(getChildIndex(param1) > -1)
               {
                  if(this.var_1831)
                  {
                     if(getChildIndex(param1) != numChildren - 1)
                     {
                        setChildIndex(param1,numChildren - 1);
                     }
                  }
                  notifyEventListeners(new WindowNotifyEvent(WindowNotifyEvent.const_352,this,this.var_178));
               }
            }
         }
      }
      
      public function addSelectableAt(param1:ISelectableWindow, param2:int) : ISelectableWindow
      {
         return ISelectableWindow(addChildAt(param1,param2));
      }
      
      public function get iterator() : IIterator
      {
         return new Iterator(this);
      }
      
      public function getSelectableByTag(param1:String) : ISelectableWindow
      {
         return getChildByTag(param1) as ISelectableWindow;
      }
      
      public function getSelectableByName(param1:String) : ISelectableWindow
      {
         return getChildByName(param1) as ISelectableWindow;
      }
      
      public function get numSelectables() : uint
      {
         return numChildren;
      }
   }
}
