include: /views/shared_views/*

view: ad_basic_stats {
  sql_table_name: (select *,GENERATE_UUID() as primary_key from `@{GOOGLE_ADS_SCHEMA}.AdBasicStats_@{GOOGLE_ADS_CUSTOMER_ID}`)    ;;
  extends: [ads_common,date_base,period_base]

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.primary_key ;;
  }

  dimension: _date {
    hidden: yes
    type: date
    sql: ${TABLE}._data_date ;;
  }

  dimension_group: _data {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._data_date ;;
  }

  dimension_group: _latest {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}._latest_date ;;
  }

  dimension: latest {
    hidden: yes
    type: yesno
    sql: ${_data_raw} = ${_latest_raw} ;;
  }

  dimension: active_view_impressions {
    type: number
    sql: ${TABLE}.active_view_impressions ;;
  }

  dimension: active_view_measurability {
    type: number
    sql: ${TABLE}.active_view_measurability ;;
  }

  dimension: active_view_measurable_cost {
    type: number
    sql: ${TABLE}.active_view_measurable_cost ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    sql: ${TABLE}.active_view_measurable_impressions ;;
  }

  dimension: active_view_viewability {
    type: number
    sql: ${TABLE}.active_view_viewability ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_network_type1 {
    type: string
    sql: ${TABLE}.ad_network_type1 ;;
  }

  dimension: ad_network_type2 {
    type: string
    sql: ${TABLE}.ad_network_type2 ;;
  }

  dimension: average_position {
    type: number
    sql: ${TABLE}.average_position ;;
  }

  dimension: base_ad_group_id {
    type: number
    sql: ${TABLE}.base_ad_group_id ;;
  }

  dimension: base_campaign_id {
    type: number
    sql: ${TABLE}.base_campaign_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversion_value {
    type: number
    sql: ${TABLE}.conversion_value ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost / 1000000.0 ;;
  }

  dimension: creative_id {
    type: number
    sql: ${TABLE}.creative_id ;;
  }

  dimension: criterion_id {
    type: number
    sql: ${TABLE}.criterion_id ;;
  }

  dimension: criterion_type {
    type: string
    sql: ${TABLE}.criterion_type ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      day_of_week_index,
      day_of_month,
      day_of_year,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.external_customer_id ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: interaction_types {
    type: string
    sql: ${TABLE}.interaction_types ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.interactions ;;
  }

  dimension: is_negative {
    type: yesno
    sql: ${TABLE}.is_negative ;;
  }

  dimension: slot {
    type: string
    sql: ${TABLE}.slot ;;
  }

  dimension: view_through_conversions {
    type: number
    sql: ${TABLE}.view_through_conversions ;;
  }
}
