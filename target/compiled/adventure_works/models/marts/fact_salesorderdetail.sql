with
 salesorderheader as (
     select 
     /* Primary key */
     salesorderid
    
     /* Foreign keys */
     
     ,customerid	
     ,shipmethodid		
     ,billtoaddressid	
     ,salespersonid
     ,rowguid
     ,territoryid
     ,creditcardid
     ,currencyrateid
     ,shiptoaddressid
     
     ,purchaseordernumber	
     ,onlineorderflag		
     ,status	
     ,creditcardapprovalcode		
     ,freight
     ,orderdate
     ,duedate
     ,taxamt	
     ,subtotal	
     ,totaldue	
     ,shipdate
     ,modifieddate		
     ,accountnumber
     ,revisionnumber


     from `adventureworks-312502`.`dbt_rodrigo`.`stg_salesorderheader`
 )
 , salesorderdetail as (
     select  
     /* Primary key */
     	
     salesorderdetailid	     
    
     /* Foreign keys */
     ,salesorderid
     ,specialofferid	
     ,rowguid		
     ,productid	

     ,orderqty	
     ,unitprice		
     ,unitpricediscount	
     ,modifieddate	
     ,carriertrackingnumber

     from `adventureworks-312502`.`dbt_rodrigo`.`stg_salesorderdetail`

 )
 , specialoffer as (
     select  
        
        /* Primary key */
         specialofferid

         ,startdate	
         ,maxqty	
         ,modifieddate	
         ,rowguid	
         ,type	
         ,discountpct	
         ,category		
         ,description	
         ,minqty	
         ,enddate	

     from `adventureworks-312502`.`dbt_rodrigo`.`stg_specialoffer`
 )

 , salesorderheadersalesreason as (
     select  
  
          salesorderid
         , motivo_1
         , motivo_2
         , motivo_3

     from `adventureworks-312502`.`dbt_rodrigo`.`stg_salesorderheadersalesreason`
 )

 , salesreason_1 as (
     select  
         /* Primary key */
         salesreasonid 
         
         ,salesreason_name as nome_motivo_1

     from `adventureworks-312502`.`dbt_rodrigo`.`stg_salesreason`
 )
  , salesreason_2 as (
     select  
         /* Primary key */
         salesreasonid 
         
         ,salesreason_name as nome_motivo_2

     from `adventureworks-312502`.`dbt_rodrigo`.`stg_salesreason`
 )
  , salesreason_3 as (
     select  
         /* Primary key */
         salesreasonid 
         
         ,salesreason_name as nome_motivo_3

     from `adventureworks-312502`.`dbt_rodrigo`.`stg_salesreason`
 )

 , creditcard as (
     select  
        /* Primary key */
         creditcardid
    
         ,cardtype	
         ,expyear	
         ,modifieddate		
         ,expmonth	
         ,cardnumber

     from `adventureworks-312502`.`dbt_rodrigo`.`stg_creditcard`
 )

 , currencyrate as (
     select  
         /* Primary key */
         currencyrateid
        
         /* Foreign keys */
         ,fromcurrencycode

         ,endofdayrate	
         ,tocurrencycode	
         ,modifieddate		
         ,currencyratedate		
         ,averagerate	

     from `adventureworks-312502`.`dbt_rodrigo`.`stg_currencyrate`
 )

 , customer as (
   select 
         /* Primary key */
         customerid 
         /* Foreign keys */
         ,personid
         ,storeid
         ,territoryid

   from `adventureworks-312502`.`dbt_rodrigo`.`stg_customer`
 )

 , adresskey as (
   select
         businessentityid
        
         /* Foreign keys */
         ,shipping_address
         ,home_address


   from `adventureworks-312502`.`dbt_rodrigo`.`stg_businessentityaddress`
 )

 , address_shipping_address as (
   select
         addressid as shipping_addressid
        
         /* Foreign keys */
         ,stateprovinceid	as shipping_stateprovinceid 
         
         ,city as shipping_city	
         ,modifieddate as shipping_modifieddate	
         ,rowguid as shipping_rowguid	
         ,postalcode as shipping_postalcode	
         ,spatiallocation as shipping_spatiallocation	
         ,addressline1 as shipping_addressline1	
         ,addressline2 as shipping_addressline2		  
   
   from `adventureworks-312502`.`dbt_rodrigo`.`stg_address`
 )
 , stateprovince_shipping_address as (
   select
         /* Primary key */
         stateprovinceid as shipping_stateprovinceid
        
         /* Foreign keys */
         ,territoryid as shipping_territoryid
         ,countryregioncode as shipping_countryregioncode
    
         ,stateprovince_name as shipping_stateprovince_name 		
         ,stateprovincecode as shipping_stateprovincecode 
         ,modifieddate as shipping_modifieddate 	
         ,rowguid as shipping_rowguid 				
         ,isonlystateprovinceflag as shipping_isonlystateprovinceflag 	
   
   from `adventureworks-312502`.`dbt_rodrigo`.`stg_stateprovince`
 )
 , countryregion_shipping_address as (
   select        
         /* Primary key */
         countryregioncode as shipping_countryregioncode
        
         /* Foreign keys */
         	
         
         ,countryregion_name as shipping_countryregion_name	
         ,modifieddate
   
   from `adventureworks-312502`.`dbt_rodrigo`.`stg_countryregion`
 ) 

 , address_home_address as (
   select
         addressid as home_addressid
        
         /* Foreign keys */
         ,stateprovinceid	as home_stateprovinceid
         
         ,city as home_city 	
         ,modifieddate as home_modifieddate 	
         ,rowguid as home_rowguid 	
         ,postalcode as home_postalcode 	
         ,spatiallocation as home_spatiallocation 	
         ,addressline1 as home_addressline1 	
         ,addressline2 as home_addressline2 		  
   
   from `adventureworks-312502`.`dbt_rodrigo`.`stg_address`
 )
 , stateprovince_home_address as (
   select
         /* Primary key */
         stateprovinceid as home_stateprovinceid
        
         /* Foreign keys */
         ,territoryid
         ,countryregioncode as home_countryregioncode
    
         ,stateprovince_name as	home_stateprovince_name
         ,stateprovincecode as home_stateprovincecode
         ,modifieddate as home_modifieddate
         ,rowguid as home_rowguid				
         ,isonlystateprovinceflag	as home_isonlystateprovinceflag 
   
   from `adventureworks-312502`.`dbt_rodrigo`.`stg_stateprovince`
 )
 , countryregion_home_address as (
   select        
         /* Primary key */
         countryregioncode
        
         /* Foreign keys */
         	
         
         ,countryregion_name as home_countryregion_name
         ,modifieddate
   
   from `adventureworks-312502`.`dbt_rodrigo`.`stg_countryregion`
 ) 
 
 , final as (
   select 
         row_number() over () as salesorderdetail_sk
         ,salesorderheader.salesorderid
         ,salesorderheader.customerid
         ,customer.personid as businessentityid
         ,salesorderheader.shipmethodid		
         ,salesorderheader.billtoaddressid	
         ,salesorderheader.salespersonid
         ,salesorderheader.rowguid
         ,salesorderheader.territoryid
         ,salesorderheader.creditcardid
         ,salesorderheader.currencyrateid
         ,salesorderheader.shiptoaddressid
         ,salesorderheader.purchaseordernumber	
         ,salesorderheader.onlineorderflag		
         ,salesorderheader.status	
         ,salesorderheader.creditcardapprovalcode		
         ,salesorderheader.freight
         ,salesorderheader.orderdate
         ,salesorderheader.duedate
         ,salesorderheader.taxamt	
         ,salesorderheader.subtotal	as ordem_subtotal
         ,salesorderheader.totaldue	
         ,salesorderheader.shipdate
         ,salesorderheader.modifieddate		
         ,salesorderheader.accountnumber
         ,salesorderheader.revisionnumber


         ,salesorderdetail.salesorderdetailid	     
         ,salesorderdetail.specialofferid		
         ,salesorderdetail.productid
         ,salesorderdetail.orderqty	
         ,salesorderdetail.unitprice
         , case when salesorderheader.currencyrateid IS NOT NULL 
           then salesorderdetail.unitprice / currencyrate.averagerate	 
           else salesorderdetail.unitprice
           end as unitprice_currencyrate		
         ,salesorderdetail.unitpricediscount	
         ,salesorderdetail.carriertrackingnumber

         ,specialoffer.startdate	
         ,specialoffer.maxqty	
         ,specialoffer.type	
         ,specialoffer.discountpct	
         ,specialoffer.category		
         ,specialoffer.description	
         ,specialoffer.minqty	
         ,specialoffer.enddate	


         ,creditcard.cardtype

         ,currencyrate.fromcurrencycode	
         ,currencyrate.tocurrencycode			
         ,currencyrate.currencyratedate		
         ,currencyrate.averagerate	

         ,adresskey.shipping_address
         ,adresskey.home_address


         /* motivo 1 */
         ,salesreason_1.nome_motivo_1

         /* motivo 2 */
         ,salesreason_2.nome_motivo_2

         /* motivo 3 */
         ,salesreason_3.nome_motivo_3


           /* shipping_address */
         ,address_shipping_address.shipping_stateprovinceid	
         ,address_shipping_address.shipping_city	
         ,address_shipping_address.shipping_postalcode	
         ,address_shipping_address.shipping_spatiallocation	
         ,address_shipping_address.shipping_addressline1	
         ,address_shipping_address.shipping_addressline2	
         
         ,stateprovince_shipping_address.shipping_countryregioncode
         ,stateprovince_shipping_address.shipping_stateprovince_name		
         ,stateprovince_shipping_address.shipping_stateprovincecode
         ,stateprovince_shipping_address.shipping_isonlystateprovinceflag	

         ,countryregion_shipping_address.shipping_countryregion_name

          /* home_address */
         ,address_home_address.home_stateprovinceid	
         ,address_home_address.home_city	
         ,address_home_address.home_postalcode	
         ,address_home_address.home_spatiallocation	
         ,address_home_address.home_addressline1	
         ,address_home_address.home_addressline2	
         
         ,stateprovince_home_address.home_countryregioncode
         ,stateprovince_home_address.home_stateprovince_name		
         ,stateprovince_home_address.home_stateprovincecode
         ,stateprovince_home_address.home_isonlystateprovinceflag	

         ,countryregion_home_address.home_countryregion_name

   from salesorderheader
   left join salesorderdetail on salesorderheader.salesorderid = salesorderdetail.salesorderid
   left join specialoffer on salesorderdetail.specialofferid = specialoffer.specialofferid
   left join creditcard on salesorderheader.creditcardid = creditcard.creditcardid
   left join currencyrate on salesorderheader.currencyrateid = currencyrate.currencyrateid

   left join customer on salesorderheader.customerid = customer.customerid
   left join adresskey on customer.personid = adresskey.businessentityid

   left join salesorderheadersalesreason on salesorderdetail.salesorderid = salesorderheadersalesreason.salesorderid
   
   /* motivo 1 */
   left join salesreason_1 on salesorderheadersalesreason.motivo_1 = salesreason_1.salesreasonid
   
   /* motivo 2 */
   left join salesreason_2 on salesorderheadersalesreason.motivo_2 = salesreason_2.salesreasonid
   /* motivo 3 */
   
   left join salesreason_3 on salesorderheadersalesreason.motivo_3 = salesreason_3.salesreasonid
   
   /* shipping_address */
   left join address_shipping_address on adresskey.shipping_address = address_shipping_address.shipping_addressid
   left join stateprovince_shipping_address on address_shipping_address.shipping_stateprovinceid = stateprovince_shipping_address.shipping_stateprovinceid
   left join countryregion_shipping_address on stateprovince_shipping_address.shipping_countryregioncode = countryregion_shipping_address.shipping_countryregioncode
   
   /* home_address */
   left join address_home_address on adresskey.home_address = address_home_address.home_addressid
   left join stateprovince_home_address on address_home_address.home_stateprovinceid = stateprovince_home_address.home_stateprovinceid
   left join countryregion_home_address on stateprovince_home_address.home_countryregioncode = countryregion_home_address.countryregioncode

 )

  select * from final