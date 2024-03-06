# Лабораторна робота №3
## Тема: JSP
## Виконав(-ли): Ковальчук Станіслав, Сухоручкін Гліб, Янович Марія і Ястремський Богдан
---
## Контрольні питання:
### 1. В чому полягає різниця між HTML-сторінками та JSP-сторінками?

**HTML-сторінки:**
- Статичні сторінки, що містять тільки HTML, CSS та JavaScript.
- Не можуть виконувати серверний код або динамічно генерувати контент на стороні сервера.

**JSP-сторінки:**
- Динамічні сторінки, які можуть містити Java-код та HTML-код.
- Використовуються для динамічного генерування вмісту на стороні сервера.
- Вбудовують Java-код безпосередньо в HTML-код за допомогою спеціальних тегів <% %>.

Коли клієнт надсилає запит на JSP-сторінку, сервер обробляє її, виконуючи весь вбудований Java-код і генеруючи HTML-відповідь для клієнта. 
В результаті клієнт отримує HTML-сторінку з динамічним вмістом, який може змінюватися в залежності від стану сервера або інших факторів.

### 2. В чому полягає різниця між сервлетами та JSP-сторінками?

**Сервлети:**
- Сервлети - це Java-класи, які реалізують інтерфейс javax.servlet.Servlet.
- Вони використовуються для обробки запитів від клієнтів і генерації відповідей на ці запити.
- Використовуються для роботи з даними, взаємодії з базою даних, обробки логіки застосунку тощо.
- Для відображення динамічного контенту сервлети можуть генерувати HTML безпосередньо або викликати JSP-сторінки.

**JSP-сторінки:**
- JSP-сторінки (JavaServer Pages) - це шаблони веб-сторінок, що містять як HTML-код, так і вбудований Java-код.
- Вони перетворюються у сервлети під час компіляції та виконуються на стороні сервера, але відрізняються від сервлетів тим, що їхній основний функціонал - це генерація вмісту веб-сторінок.
- JSP-сторінки спрощують розробку веб-сторінок, оскільки дозволяють вбудовувати Java-код безпосередньо в HTML.
- Зазвичай використовуються для представлення динамічного вмісту, який згенеровано на сервері, і вони здатні легко включати Java-код в HTML-розмітку.

### 3. Як виглядає життєвий цикл JSP-сторінки? Що таке трансляція та компіляція JSP-сторінок?  

- Створення (Creation):
   - Коли клієнтський браузер надсилає запит на JSP-сторінку, контейнер сервлетів (наприклад, Apache Tomcat) визначає, чи була сторінка раніше виконана чи вона вперше запускається.
   - Якщо сторінка ще не була виконана, контейнер ініціалізує сторінку та виконує компіляцію.

- Трансляція (Translation):
   - Контейнер сервлетів перетворює JSP-файл на сервлет Java-код за допомогою спеціального компілятора JSP (JSP compiler).
   - JSP-файл містить як HTML-код, так і Java-код (як правило, вбудований у теги <% %>), який потрібно перетворити на еквівалентний Java-код.

- Компіляція (Compilation):
   - Контейнер сервлетів компілює згенерований Java-код і створює байткод (.class-файл) з цього коду.
   - Створений .class-файл є сервлетом, який може виконуватися на сервері.

- Ініціалізація (Initialization):
  - Після компіляції контейнер сервлетів завантажує сторінку та створює її екземпляр.
  - Він також викликає метод init() для ініціалізації сторінки та підготовки її до обробки запитів.

- Обробка запитів (Request Processing):
  - Після ініціалізації сторінка готова обробляти запити від клієнтів.
  - Коли клієнт надсилає запит, контейнер сервлетів виконує метод service(), який виконує логіку сторінки та генерує відповідь.

- Знищення (Destruction):
  - Якщо сторінка вже не потрібна (наприклад, після закінчення сесії або при зупинці сервера), контейнер сервлетів може викликати метод destroy(), щоб звільнити ресурси, призначені для сторінки.

*Трансляція JSP-сторінки* означає перетворення JSP-файлу на сервлет Java-код.

*Компіляція JSP-сторінки* включає компіляцію згенерованого Java-коду в байткод для виконання на Java віртуальній машині (JVM).

### 4. Що таке скриптлети? 

**Скриптлети** - це фрагменти Java-коду, які вбудовані безпосередньо в JSP-сторінку за допомогою спеціальних тегів <% %>.

У JSP можна використовувати скриптлети для виконання будь-якого Java-коду прямо в середині сторінки. 
Наприклад, ви можете виконати умовні оператори, цикли, виклики методів Java-класів та інше. 
Скриптлети дозволяють динамічно генерувати вміст сторінки в залежності від стану програми або змінних оточення.

### 5. Як у JSP створити локальну змінну та змінну на рівні класу?

**Локальні змінні** в JSP визначаються за допомогою скриптлетів <% %> та використанням оператора декларації Java. Вони можуть бути використані тільки в межах того самого скриптлета.
Приклад створення локальної змінної:
```html
<% 
    String name = "John";
    out.println("Привіт, " + name);
%>
```

Заміна на рівні класу за допомогою директиви <%! %> для створення змінних на рівні класу, які будуть доступні у всіх методах сервлета (у цьому випадку, сервлет, який генерується з JSP-файлу).
Приклад створення змінної на рівні класу:
```html
<%!
    private String globalVariable = "Global Variable";
%>
```

### 6. Які бувають директивні елементи?

**Директива page:**
Використовується для вказівки атрибутів, таких як мова програмування, клас сервлета, рекомендації щодо використання кешування і т.д.
Приклад:
```html
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
```

**Директива include:**
Використовується для включення статичного або динамічного вмісту з іншого ресурсу (зазвичай, ще одного JSP-файлу).
Приклад:
```html
<%@ include file="header.jsp" %>
```

**Директива taglib:**
Використовується для підключення бібліотек тегів JSP.
Приклад:
```html
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
```

**Директива directive:**
Використовується для встановлення атрибутів в контексті JSP-файлу, таких як info і pageEncoding.
Приклад:
```html
<%@ directive attribute="value" %>
```

### 7. В чому полягає різниця між директивою <%@ include%> та елементом <jsp:include>?

**<%@ include %>:**
- Це директива, яка виконується під час обробки JSP-файлу сервером.
- Під час компіляції вміст файлу, вказаного в директиві, буде вставлений безпосередньо в JSP-сторінку.
- Включений вміст статичний і не може бути змінений в залежності від умов виконання на стороні сервера під час відображення сторінки користувачу.

**<.jsp:.include>:**
- Це JSP-елемент, який виконується під час відображення JSP-сторінки клієнтові.
- Включений вміст може бути динамічно змінений в залежності від умов виконання на стороні сервера.
- Включений файл оброблюється сервером під час кожного запиту, що може призвести до додаткового навантаження на сервер у порівнянні зі статичним включенням.

### 8. Що таке JavaBean? Як їх використовувати у JSP-сторінках?
**JavaBean** - це клас у Java, який служить для зберігання даних та надання методів доступу до цих даних через гетери (методи доступу до даних) і сетери (методи встановлення даних). JavaBeans зазвичай використовуються для створення об'єктів, які представляють структури даних або моделі даних у програмі. У JSP-сторінках JavaBeans використовуються для передачі даних з Java-коду (наприклад, з сервлета) до HTML-коду.

- Створення JavaBean:
```html
public class UserBean {
    private String username;
    private String email;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
```

- Інстанціювання JavaBean у JSP
```html
<%@ page import="com.example.UserBean" %>
<jsp:useBean id="user" class="com.example.UserBean" />
```

- Використання JavaBean у JSP
```html
<p>Username: <%= user.getUsername() %></p>
<p>Email: <%= user.getEmail() %></p>
```

---
## Висновки:
У ході цієї лаборатоної роботи, ми дізналися багато нової інформації про принципироботи JSP, спробували примінити свої знання на практиці, створюючи власну сторінку з їх використанням, і закріпили здобуту теоретичну базу, відповідаючи на контрольні питання.
