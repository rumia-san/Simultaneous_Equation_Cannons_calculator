setlocal enabledelayedexpansion
@echo off

:: ��ӡ������Ϣ
echo **************************************************
echo *
echo *        �B �� �h �� �� ʽ �� �� �� ��
echo *
echo * ��˫���ֿ��ͳ��ϵĿ���������Ϊ A����ô��
echo * ���Լ��Ķ��⿨�����2ֻ��ͬ�ȼ���XYZ���޺�1ֻ�ںϹ��ޣ�
echo * ����Щ���޵ĵȼ��ĺϼ�Ҫ���� A��
echo * ��ÿֻXYZ���޵ĵȼ�Ϊ X���ںϹ��޵ĵȼ�Ϊ Y����ô��ʽΪ��
echo *
echo *     2X + Y = A
echo *
echo * ����Ч����
echo * ѡ��Է�����1ֻ����ʾ���ޣ�
echo * ʹ�����1ֻXYZ���޺�1ֻ�ںϹ��޵ĵȼ��ϼƵ��ڸù��޵ĵȼ� B������
echo *
echo *     X + Y = B
echo *
echo * �������
echo *
echo *     XYZ���޵ĵȼ� X ӦΪ A - B
echo *     �ںϹ��޵ĵȼ� Y ӦΪ 2B - A
echo *
echo **************************************************

:input
set /p B="������Է����ϱ���ʾ���޵ĵȼ� (B) �������� 'exit' �˳�����"

if /i "%B%"=="exit" goto end

set /a B=%B%

if %B% LEQ 0 (
    echo �ȼ��������0�����������롣
    goto input
)

:: ������ܵ����
echo.
echo ���ܵ����:
for /L %%X in (1,1,%B%) do (
    set /a Y=%B% - %%X
    if !Y! GEQ 1 (
        set /a A=2 * %%X + !Y!
        echo ��˫�����ƺͳ��ϵĿ���������: !A!������XYZ���޵ȼ�: %%X���ںϹ��޵ȼ�: !Y!��
    )
)

goto input

:end
