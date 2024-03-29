﻿#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Новый Заказ

Сценарий: Я создаю новый Заказ и заполняю шапку

* Загрузка тестовых данных
	Дано Создание объектов для справочника Валюты
	И Создание объектов для справочника ВидыЦен
	И Создание объектов для справочника Организации
	И Создание объектов для справочника Склады
	И Создание объектов для справочника Контрагенты
* Создание нового Заказа
	Когда В командном интерфейсе я выбираю 'Продажи' 'Заказ'
	Тогда открылось окно 'Заказ (создание)'
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Наименование'       |
		| 'Животноводство ООО' |
	И в таблице "Список" я выбираю текущую строку
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Большой'
	И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Оптовая'
		