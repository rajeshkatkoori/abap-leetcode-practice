 METHOD palindrome_string.
    DATA: lv_input        TYPE string.

*..//Input for no. of consecutive elements
    cl_demo_input=>add_field( CHANGING field = lv_input ).
    cl_demo_input=>request( ).

    TRANSLATE lv_input TO UPPER CASE.
    CONDENSE lv_input NO-GAPS.
*...//Two pointer
    DATA: lv_len     TYPE i,
          lv_len2    TYPE i,
          lv_counter TYPE i,
          lv_index   TYPE i.

*...Two Pointer Approach 2
    lv_len = strlen( lv_input ).
    DATA(lv_start) = 0.
    DATA(lv_end) = lv_len - 1.
    lv_counter = 1.
    WHILE ( lv_start < lv_end ).

      WHILE NOT ( lv_input+lv_start(1) CO sy-abcde ) AND lv_start < lv_end.
        lv_start += 1.
      ENDWHILE.

      WHILE NOT ( lv_input+lv_end(1) CO sy-abcde ) AND lv_end > lv_start.
        lv_end -= 1.
      ENDWHILE.

      IF lv_input+lv_start(1) = lv_input+lv_end(1).
        lv_start += 1.
        lv_end -= 1.
      ELSE.
        lv_counter = 0.
        EXIT.
      ENDIF.
    ENDWHILE.
    IF lv_counter = 0.
      WRITE:/ 'String is not a Palindrome'.
    ELSE.
      WRITE:/ 'String is a Palindrome'.
    ENDIF.
  ENDMETHOD.
