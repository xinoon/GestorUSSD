xquery version "2004-draft";
(:: pragma bea:global-element-return element="ns0:aplicarPromocion" location="../../../BenePro/Resources/WSDLs/Recv.xsd" ::)

declare namespace ns0 = "http://recv.ws.srv.promo.wom.smartdici/";
declare namespace xf = "http://tempuri.org/PortalCautivo/Resources/XQuery/IN_XQ_BenePro_AplicaPromociones/";

declare function xf:IN_XQ_BenePro_AplicaPromociones($phone_number as xs:string,
    $vigencia as xs:string,
    $channel_act as xs:string,
    $segment_prod as xs:string,
    $rate_plan as xs:string,
    $tariff_prod as xs:string,
    $id_pcrf_prod as xs:string,
    $id_prod as xs:string,
    $cod_plan as xs:string,
    $type_prod_bscs as xs:string,
    $traffic_type as xs:string)
    as element(ns0:aplicarPromocion) {
        <ns0:aplicarPromocion>
            <evento>
                <accion>ALTA</accion>
                <beneficiario>
                    <codContrato>{ $phone_number }</codContrato>
                    <idBeneficiario>{ $phone_number }</idBeneficiario>
                </beneficiario>
                <idEvento>PROCOMBOL</idEvento>
                <onDemand>false</onDemand>
                <tipoEvento>PROCOMBOL</tipoEvento>                
                <atributosFicha2>
                    <entry>
                        <key>VIGENCIA</key>
                        <value>{ $vigencia }</value>
                    </entry>
                    <entry>
                        <key>SHDES</key>
                        <value>{ $rate_plan }</value>
                    </entry>
                    <entry>
                        <key>COD_PLAN</key>
                        <value>{ $cod_plan }</value>
                    </entry>                   
                    <entry>
                        <key>TARIFA</key>
                        <value>{ $tariff_prod }</value>
                    </entry> 
                    <entry>
                        <key>ID_PROD</key>
                        <value>{ $id_prod }</value>
                    </entry>
                    <entry>
                        <key>ID_BOLSA</key>
                        <value>{ $id_pcrf_prod }</value>
                    </entry>   
                    <entry>
                        <key>SEGMENTO</key>
                        <value>{ $segment_prod }</value>
                    </entry> 
                    <entry>
                        <key>CANAL</key>
                        <value>{ $channel_act }</value>
                    </entry>           
                    <entry>
                        <key>TIPO_TRAFICO</key>
                        <value>{if(empty($type_prod_bscs)) then 
						($traffic_type) 
						else (
						if(upper-case($type_prod_bscs) eq 'BOL_MIX') then 
						('MIXTA') 
						else 
						($traffic_type)
						)
                        }</value>
                    </entry>  
                </atributosFicha2>
            </evento>
        </ns0:aplicarPromocion>
};

declare variable $phone_number as xs:string external;
declare variable $vigencia as xs:string external;
declare variable $channel_act as xs:string external;
declare variable $segment_prod as xs:string external;
declare variable $rate_plan as xs:string external;
declare variable $cod_plan as xs:string external;
declare variable $tariff_prod as xs:string external;
declare variable $id_pcrf_prod as xs:string external;
declare variable $id_prod as xs:string external;
declare variable $type_prod_bscs as xs:string external;
declare variable $traffic_type as xs:string external;

xf:IN_XQ_BenePro_AplicaPromociones($phone_number,
    $vigencia,
    $channel_act,
    $segment_prod,
    $rate_plan,
    $tariff_prod,
    $id_pcrf_prod,
    $id_prod,
    $cod_plan,
    $type_prod_bscs,
    $traffic_type)