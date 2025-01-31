<body>
    <div class="container">
        <div class="form-container">
            <form action="add_faq" method="post">
                <label for="question">Question:</label><br>
                <textarea id="question" name="question"></textarea><br>
                <label for="answer"> Answer:</label> <br>
                <textarea id="answer" name="answer"></textarea><br>
                <input type="submit" value="Submit">
            </form>
            <br>
            ${res}
            <br>
            <a href="/view_faq"><input type="button" value="View FAQ"></a>
        </div>
    </div>
</body>