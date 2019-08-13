MACRO(SETUP_TESTING)
  enable_testing()
  include(CTest)
ENDMACRO(SETUP_TESTING)

MACRO(ADD_TEST_TARGET target)
  ADD_TEST(NAME ${target} COMMAND $<TARGET_FILE:${target}>)
ENDMACRO(ADD_TEST_TARGET)
