package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem
   {
       
      
      private var var_966:Array;
      
      protected var var_88:Offer;
      
      private var var_732:int;
      
      public function ProductContainer(param1:Offer, param2:Array)
      {
         super();
         this.var_88 = param1;
         this.var_966 = param2;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
      
      public function initProductIcon(param1:IRoomEngine) : void
      {
      }
      
      public function get iconCallbackId() : int
      {
         return this.var_732;
      }
      
      public function get offer() : Offer
      {
         return this.var_88;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         for each(_loc1_ in this.var_966)
         {
            _loc1_.dispose();
         }
         this.var_966 = null;
         this.var_732 = 0;
      }
      
      public function get products() : Array
      {
         return this.var_966;
      }
      
      public function get firstProduct() : IProduct
      {
         return this.var_966[0] as IProduct;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         this.var_732 = param1;
      }
   }
}
