package nl.crypton.zebrascanner;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.bridge.WritableNativeArray;
import com.facebook.react.bridge.WritableNativeMap;

import java.util.List;

public class ZebraScannerModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public ZebraScannerModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "ZebraScanner";
    }

    @ReactMethod
    public void setEnabled(boolean isEnabled) {
    }

    @ReactMethod
    public void getActiveScanners(Callback callback) {
        WritableArray writableScanners = new WritableNativeArray();
        callback.invoke(writableScanners);
    }
}
