package com.lv.reg.bot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.ReplyKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.KeyboardButton;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.KeyboardRow;

import java.util.ArrayList;
import java.util.List;

@Component
public class SecondStage implements ActionOptions {
    @Autowired
    SearchStage searchStage;
    @Autowired
    InitialStage initialStage;
    @Override
    public void setActionButtons(SendMessage sendMessage) {
        ReplyKeyboardMarkup replyKeyboardMarkup = new ReplyKeyboardMarkup();
        sendMessage.setReplyMarkup(replyKeyboardMarkup);
        replyKeyboardMarkup.setSelective(true);
        replyKeyboardMarkup.setResizeKeyboard(true);
        replyKeyboardMarkup.setOneTimeKeyboard(false);

        List<KeyboardRow> keyboardRowList = new ArrayList<>();

        KeyboardRow keyboardRow = new KeyboardRow();
        keyboardRow.add(new KeyboardButton("Шо робити ?"));
        keyboardRow.add(new KeyboardButton("Назад"));

        keyboardRowList.add(keyboardRow);
        replyKeyboardMarkup.setKeyboard(keyboardRowList);
    }

    @Override
    public ActionOptions handleMessage(String response, SendMessage sendMessage) {
        if(response.equals("Шо робити ?")){
            sendMessage.setText("Вибирай варіант -> ");
            return searchStage;
        }else if (response.equals("Назад")){
            sendMessage.setText("ok )");
            return initialStage;
        }else {
            sendMessage.setText("Всі кажуть " + response + " а ти купи слона");
            return this;
        }
    }
}
