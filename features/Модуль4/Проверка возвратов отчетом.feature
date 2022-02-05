#language: ru

@tree

Функционал: Возвраты товаров от покупателей

Как Тестировщик я хочу
проверить корректность проведения возврата
чтобы не влетело от главбуха

Контекст:
	И Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка отражения возвратов в отчете D2001 Продажи

	* Загрузка первоначальных данных
		Дано Экспорт основных данных
		И Экспорт возврата от покупателя
		И я выполняю код встроенного языка на сервере
		"""bsl
			Documents.SalesReturn.FindByNumber("909", '20220101').GetObject().Write(DocumentWriteMode.Posting);
		"""		
	* Формирование отчета
		Допустим Я открываю основную форму отчета "D2001_Sales"
		Тогда открылось окно 'D2001 Продажи'		
		И я нажимаю на кнопку 'Изменить вариант...'
		Тогда открылось окно 'Вариант "Default" отчета "D2001 Продажи"'
		И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
			| 'Параметр' |
			| 'Период'   |
		И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersStartDate' я ввожу текст '01.02.2022  0:00:00'
		И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
		И в таблице "SettingsComposerSettingsDataParameters" я активизирую поле с именем "SettingsComposerSettingsDataParametersEndDate"
		И в таблице "SettingsComposerSettingsDataParameters" я выбираю текущую строку
		И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersEndDate' я ввожу текст '28.02.2022  0:00:00'
		И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
		Когда открылось окно 'Вариант "Default" отчета "D2001 Продажи"'
		И я нажимаю на кнопку с именем 'FormEndEdit'		
		И я нажимаю на кнопку 'Сформировать'
		
	* Проверка отчета
		И я жду когда в табличном документе "Result" заполнится ячейка "R9C3" в течение 20 секунд		
		И табличный документ "Result" содержит строки по шаблону:
			| 'Февраль 2022' | '-1,000' | '-100,00' | '-83,33' | '' |
			| 'Услуга'      | '-1,000' | '-100,00' | '-83,33' | '' |
			| 'Услуга'      | '-1,000' | '-100,00' | '-83,33' | '' |
			| 'Итого'       | '-1,000' | '-100,00' | '-83,33' | '' |
		
			
			
		