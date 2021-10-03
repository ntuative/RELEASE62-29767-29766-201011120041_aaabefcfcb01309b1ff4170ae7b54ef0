package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_316:int;
      
      private var var_62:EffectsModel;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_62 = param1;
         this.var_316 = param2;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_62.getEffects(this.var_316);
      }
      
      public function dispose() : void
      {
         this.var_62 = null;
      }
   }
}
