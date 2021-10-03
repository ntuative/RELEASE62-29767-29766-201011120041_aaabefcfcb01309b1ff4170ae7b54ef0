package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_400:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
         this.var_400 = PlaceholderAvatarImage.var_400;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_362:
               switch(_loc3_)
               {
                  case AvatarAction.const_786:
                  case AvatarAction.const_475:
                  case AvatarAction.const_316:
                  case AvatarAction.const_701:
                  case AvatarAction.const_370:
                  case AvatarAction.const_629:
                     super.appendAction(param1,[_loc3_]);
               }
               break;
            case AvatarAction.const_260:
            case AvatarAction.const_652:
            case AvatarAction.const_204:
            case AvatarAction.const_732:
            case AvatarAction.const_746:
            case AvatarAction.const_601:
               super.addActionData(param1,_loc3_);
         }
         return true;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_911)
         {
            var_82 = null;
            _assets = null;
            var_212 = null;
            var_247 = null;
            var_597 = null;
            var_491 = null;
            var_280 = null;
            if(!var_1138 && var_39)
            {
               var_39.dispose();
            }
            var_39 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_715 = null;
            var_911 = true;
         }
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
