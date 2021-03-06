with
 productsubcategory as (
     select 
         /* Primary key */
         productsubcategoryid		
         /* Foreign keys */
         ,productcategoryid	

         ,subcategory_name
         ,subcategory_rowguid
         ,subcategory_modifieddate


         /* Stich coluns */
         ,_sdc_table_version		
         ,_sdc_received_at
         ,_sdc_extracted_at
         ,_sdc_sequence	
         ,last_etl_run

         from {{ ref('stg_productsubcategory') }}
 ), 

 productcategory as (
     select 
         productcategoryid	         
         
         ,prodcategory_name
         ,prodcategory_modifieddate 
         ,prodcategory_rowguid

         /* Stich coluns */
         ,_sdc_table_version		
         ,_sdc_received_at
         ,_sdc_extracted_at
         ,_sdc_sequence	
         ,last_etl_run

     from {{ ref('stg_productcategory') }}
 ),

 product as (
    select 
         /* Primary key */
         productid
        
         /* Foreign keys */
         ,productsubcategoryid
         ,productmodelid	

         ,name
         ,sellenddate		
         ,safetystocklevel	
         ,finishedgoodsflag	
         ,class	
         ,makeflag	
         ,productnumber	
         ,reorderpoint	
         ,modifieddate	
         ,rowguid	
         ,weightunitmeasurecode	
         ,standardcost			
         ,style	
         ,sizeunitmeasurecode		
         ,listprice	
         ,daystomanufacture	
         ,productline	
         ,size	
         ,color	
         ,sellstartdate	
         ,weight	
     
     
         /* Stich coluns */
         ,_sdc_table_version		
         ,_sdc_received_at
         ,_sdc_extracted_at
         ,_sdc_sequence	
         ,last_etl_run

     from {{ ref('stg_product') }}
 ),
 
 final as (
     select          
         /* Primary key */
         product.productid
        
         /* Foreign keys */
         ,product.productsubcategoryid
         ,product.productmodelid	

         ,product.name
         ,product.sellenddate		
         ,product.safetystocklevel	
         ,product.finishedgoodsflag	
         ,product.class	
         ,product.makeflag	
         ,product.productnumber	
         ,product.reorderpoint	
         ,product.modifieddate	
         ,product.rowguid	
         ,product.weightunitmeasurecode	
         ,product.standardcost			
         ,product.style	
         ,product.sizeunitmeasurecode		
         ,product.listprice	
         ,product.daystomanufacture	
         ,product.productline	
         ,product.size	
         ,product.color	
         ,product.sellstartdate	
         ,product.weight

         ,productsubcategory.subcategory_name
         ,productsubcategory.subcategory_rowguid
         ,productsubcategory.subcategory_modifieddate

         ,productcategory.prodcategory_name
         ,productcategory.prodcategory_modifieddate 
         ,productcategory.prodcategory_rowguid

     from product
     left join productsubcategory on product.productsubcategoryid = productsubcategory.productsubcategoryid
     left join productcategory on productcategory.productcategoryid = productsubcategory.productcategoryid
 )
 

 select * from final 