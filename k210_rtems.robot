*** Settings ***
Suite Setup                   Setup
Suite Teardown                Teardown
Test Setup                    Reset Emulation
Test Teardown                 Test Teardown
Resource                      ${RENODEKEYWORDS}

*** Variables ***
${SCRIPT}                     ${CURDIR}/k210_rtems.resc
${UART}                       sysbus.uart

*** Keywords ***
Prepare Sample
    [Arguments]  ${sample_name}

    Execute Command           $bin="${CURDIR}/${sample_name}"
    Execute Script            ${SCRIPT}
    Set Default Uart Timeout  60
    Create Terminal Tester    ${UART}

*** Test Cases ***
Should Pass Hello Test
    [Documentation]           RTEMS Hello test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/samples/hello.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST HELLO WORLD ***

Should Pass Ticker Test
    [Documentation]           RTEMS Ticker test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/samples/ticker.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST CLOCK TICK *** 

Should Pass Base SP Test
    [Documentation]           RTEMS Base SP test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/samples/base_sp.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST SAMPLE SINGLE PROCESSOR APPLICATION *** 

Should Pass Cons/Dest Test
    [Documentation]           RTEMS Constructor Destructor test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/samples/cdtest.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST CONSTRUCTOR/DESTRUCTOR *** 

Should Pass IO Stream Test
    [Documentation]           RTEMS I/O Stream test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/samples/iostream.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST IOSTREAM *** 

Should Pass Nanoseconds Test
    [Documentation]           RTEMS Nanoseconds test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/samples/nsecs.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST NANOSECOND CLOCK *** 

Should Pass Unlimited Test
    [Documentation]           RTEMS Unlimited test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/samples/unlimited.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST UNLIMITED TASK *** 

Should Pass Paranoia Test
    [Documentation]           RTEMS Paranoia test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/samples/paranoia.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST PARANOIA ***

Should Pass Dhrystone Benchmark Test 
    [Documentation]           RTEMS Dhrystone Benchmark test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/benchmarks/dhrystone.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST DHRYSTONE ***

Should Pass Whetstone Benchmark Test 
    [Documentation]           RTEMS Whetstone Benchmark test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/benchmarks/whetstone.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST WHETSTONE ***

Should Pass Linpack Benchmark Test 
    [Documentation]           RTEMS Linpack Benchmark test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/benchmarks/linpack.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST LINPACK ***

Should Pass SMP01 Test
    [Documentation]           RTEMS SMP 01 test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/smptests/smp01.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST SMP 1 *** 

Should Pass SMP08 Test
    [Documentation]           RTEMS SMP 08 test.
    [Tags]                    rtems uart
    Prepare Sample            testsuites/smptests/smp08.exe 
    Start Emulation
    Wait For Line On Uart     *** END OF TEST SMP 8 *** 

Should Pass RKI Test
    [Documentation]           RTEMS RKI test.
    [Tags]                    rtems uart
    Prepare Sample            rki.elf 
    Start Emulation
    Wait For Line On Uart     RTEMS Shell on /dev/console.


