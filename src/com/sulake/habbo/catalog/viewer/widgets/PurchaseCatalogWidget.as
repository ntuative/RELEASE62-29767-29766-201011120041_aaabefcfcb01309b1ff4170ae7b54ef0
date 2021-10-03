package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2486:XML;
      
      private var var_1758:ITextWindow;
      
      private var var_1355:Function;
      
      private var var_1759:ITextWindow;
      
      private var var_2484:XML;
      
      private var var_889:IWindowContainer;
      
      private var var_2588:ITextWindow;
      
      private var var_2485:String = "";
      
      private var var_2619:IButtonWindow;
      
      private var var_2483:XML;
      
      private var var_1757:ITextWindow;
      
      private var var_2487:XML;
      
      private var var_593:IButtonWindow;
      
      private var var_88:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_359:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2484) as IWindowContainer;
               break;
            case Offer.const_503:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2487) as IWindowContainer;
               break;
            case Offer.const_470:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2486) as IWindowContainer;
               break;
            case Offer.const_789:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2483) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_88.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_889 != null)
            {
               _window.removeChild(this.var_889);
               this.var_889.dispose();
            }
            this.var_889 = _loc2_;
            _window.addChild(_loc2_);
            this.var_889.x = 0;
            this.var_889.y = 0;
         }
         this.var_1757 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_1759 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_1758 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2588 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_593 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_593 != null)
         {
            if(this.var_1355 != null)
            {
               this.var_593.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1355);
            }
            else
            {
               this.var_593.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1355);
               this.var_593.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_593.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_88 != null)
         {
            Logger.log("Init Purchase: " + this.var_88.offerId + " " + this.var_88.localizationId);
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_88,page.pageId,this.var_2485);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2484 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2487 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2486 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            this.var_2483 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_1074,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_2485 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_88 = param1.offer;
         this.attachStub(this.var_88.priceType);
         if(this.var_1757 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_88.priceInCredits));
            this.var_1757.caption = "${catalog.purchase.price.credits}";
         }
         if(this.var_1759 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(this.var_88.priceInPixels));
            this.var_1759.caption = "${catalog.purchase.price.pixels}";
         }
         if(this.var_1758 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(this.var_88.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(this.var_88.priceInPixels));
            this.var_1758.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(this.var_593 != null)
         {
            this.var_593.enable();
         }
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1355 = param1.callback;
      }
   }
}
