import { useEffect, useRef, useState } from "react";
import { StyleSheet, Text, View } from "react-native";

export function TimerRefDemo() {
  const timerId = useRef<ReturnType<typeof setInterval> | null>(null);
  const [countUp, setCountUp] = useState<number>(0);
  const [countDown, setCountDown] = useState<number>(1000);

  useEffect(() => {
    timerId.current = setInterval(() => {
      setCountUp((v) => {
        if (v >= 1000) {
          return v;
        }
        return v + 1;
      });

      setCountDown((v) => {
        if (v <= 0) {
          return v;
        }
        return v - 1;
      });
    }, 1000);

    return () => {
      if (timerId.current) clearInterval(timerId.current);
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.value}>{countUp}s</Text>
      <Text style={styles.value}>{countDown}s</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    alignItems: "center",
    justifyContent: "center",
    padding: 16,
  },
  value: {
    color: "#58a6ff",
    fontSize: 32,
    fontWeight: "900",
    marginVertical: 10,
  },
});
