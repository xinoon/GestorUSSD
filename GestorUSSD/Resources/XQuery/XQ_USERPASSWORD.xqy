xquery version "2004-draft" encoding "Cp1252";
(:: pragma  type="xs:anyType" ::)

declare namespace xf = "http://tempuri.org/GestorUSSD/Resources/XQuery/XQ_USERPASSWORD/";

declare function xf:XQ_USERPASSWORD()
as element(*) {
        <dataUser>
            <user>apiuser</user>
            <pass>apiuser123</pass>
        </dataUser>  
};


xf:XQ_USERPASSWORD()