xquery version "2004-draft";
(:: pragma bea:global-element-parameter parameter="$getUpsellingCompraBolsasResponse1" element="ns0:getUpsellingCompraBolsasResponse" location="../WSDLs/BSCSUpsellingBolsasService_schema.xsd" ::)
(:: pragma bea:global-element-return element="ns0:getUpsellingCompraBolsasResponse" location="../WSDLs/BSCSUpsellingBolsasService_schema.xsd" ::)

declare namespace ns0 = "http://upselling.bolsas.bscs.bundle.ws.ncl.nii.com";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/OUT_XQ_BSCSUpsellingBolsasGeneral/";

declare function xf:OUT_XQ_BSCSUpsellingBolsasGeneral($getUpsellingCompraBolsasResponse1 as element(ns0:getUpsellingCompraBolsasResponse))
    as element(ns0:getUpsellingCompraBolsasResponse) {
        <ns0:getUpsellingCompraBolsasResponse>
            <bundleAmount>{fn:count($getUpsellingCompraBolsasResponse1/listaBundles/node())}</bundleAmount>
            <listaBundles>{ $getUpsellingCompraBolsasResponse1/listaBundles/@* , $getUpsellingCompraBolsasResponse1/listaBundles/node() }</listaBundles>
            <errorCode>0</errorCode>
            <errorDescription>{ if(fn:count($getUpsellingCompraBolsasResponse1/listaBundles/node()) > 0 )then
            ('OK')
            else('No hay oferta disponible para cliente.') }</errorDescription>
        </ns0:getUpsellingCompraBolsasResponse>
};

declare variable $getUpsellingCompraBolsasResponse1 as element(ns0:getUpsellingCompraBolsasResponse) external;

xf:OUT_XQ_BSCSUpsellingBolsasGeneral($getUpsellingCompraBolsasResponse1)