xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace hd="http://com.ztesoft.zsmart/xsd";


declare function local:func() as element(hd:AuthHeader) {
    <hd:AuthHeader>
         <Username>NY</Username>
         <Password>smart</Password>
      </hd:AuthHeader>
};

local:func()
