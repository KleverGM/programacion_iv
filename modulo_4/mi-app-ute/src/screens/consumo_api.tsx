import { useEffect, useState } from "react";
import {
  ActivityIndicator,
  ScrollView,
  StyleSheet,
  Text,
  View,
} from "react-native";

type InstructorDTO = {
  id: number;
  username: string;
  first_name: string;
  last_name: string;
  email: string;
};

type CursoDTO = {
  id: number;
  titulo: string;
  descripcion: string;
  categoria: string;
  nivel: string;
  fecha_creacion: string;
  instructor: InstructorDTO;
  precio: string;
  imagen: string | null;
};

export function ConsumoApi() {
  const [cursos, setCursos] = useState<CursoDTO[]>([]);
  const [loading, setLoading] = useState<boolean>(false);

  useEffect(() => {
    const controller = new AbortController();

    async function load() {
      setLoading(true);
      try {
        const res = await fetch(
          "https://cursos-online-api.desarrollo-software.xyz/api/cursos/",
          {
            signal: controller.signal,
          }
        );

        if (!res.ok) {
          throw new Error(`HTTP error! status: ${res.status}`);
        }

        const data = await res.json();

        // La API puede devolver el array en una propiedad específica
        // Verificamos si data es un array o si tiene una propiedad que contiene el array
        if (Array.isArray(data)) {
          setCursos(data);
        } else if (data && Array.isArray(data.data)) {
          setCursos(data.data);
        } else if (data && Array.isArray(data.results)) {
          setCursos(data.results);
        } else {
          console.log("Estructura de respuesta:", data);
          setCursos([]);
        }
      } catch (error) {
        console.error("Error al cargar cursos:", error);
        setCursos([]);
      } finally {
        setLoading(false);
      }
    }

    load().catch(() => {
      setLoading(false);
    });

    return () => {
      controller.abort();
    };
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Lista de Cursos</Text>

      {loading ? (
        <View style={styles.row}>
          <ActivityIndicator color="#58a6ff" />
          <Text style={styles.body}>Cargando cursos...</Text>
        </View>
      ) : null}

      {!loading && cursos.length === 0 ? (
        <Text style={styles.body}>No hay cursos disponibles</Text>
      ) : null}

      {!loading && cursos.length > 0 ? (
        <ScrollView style={styles.scrollView}>
          {cursos.map((curso) => (
            <View key={curso.id} style={styles.cursoCard}>
              <Text style={styles.cursoTitulo}>{curso.titulo}</Text>
              <Text style={styles.cursoDescripcion}>{curso.descripcion}</Text>

              <View style={styles.infoRow}>
                <Text style={styles.label}>Categoría:</Text>
                <Text style={styles.value}>{curso.categoria}</Text>
              </View>

              <View style={styles.infoRow}>
                <Text style={styles.label}>Nivel:</Text>
                <Text style={styles.value}>{curso.nivel}</Text>
              </View>

              <View style={styles.infoRow}>
                <Text style={styles.label}>Instructor:</Text>
                <Text style={styles.value}>
                  {curso.instructor.first_name} {curso.instructor.last_name}
                </Text>
              </View>

              <View style={styles.infoRow}>
                <Text style={styles.label}>Precio:</Text>
                <Text style={styles.precio}>${curso.precio}</Text>
              </View>
            </View>
          ))}
        </ScrollView>
      ) : null}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#0d1117",
    padding: 16,
  },
  title: {
    color: "#58a6ff",
    fontWeight: "900",
    fontSize: 20,
    marginBottom: 16,
    textAlign: "center",
  },
  body: {
    color: "#c9d1d9",
    marginLeft: 8,
    opacity: 0.9,
  },
  row: {
    flexDirection: "row",
    alignItems: "center",
    marginBottom: 10,
    justifyContent: "center",
  },
  scrollView: {
    flex: 1,
  },
  cursoCard: {
    backgroundColor: "#161b22",
    borderColor: "#30363d",
    borderWidth: 1,
    borderRadius: 12,
    padding: 16,
    marginBottom: 12,
  },
  cursoTitulo: {
    color: "#58a6ff",
    fontWeight: "800",
    fontSize: 18,
    marginBottom: 8,
  },
  cursoDescripcion: {
    color: "#c9d1d9",
    opacity: 0.9,
    marginBottom: 12,
    lineHeight: 20,
  },
  infoRow: {
    flexDirection: "row",
    marginBottom: 6,
  },
  label: {
    color: "#8b949e",
    fontWeight: "600",
    width: 90,
  },
  value: {
    color: "#c9d1d9",
    flex: 1,
  },
  precio: {
    color: "#3fb950",
    fontWeight: "700",
    fontSize: 16,
  },
});
