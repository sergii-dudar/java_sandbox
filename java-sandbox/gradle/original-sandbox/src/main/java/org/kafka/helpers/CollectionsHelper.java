package org.kafka.helpers;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.collections4.MultiSet;
import org.apache.commons.collections4.SetUtils;
import org.apache.commons.collections4.multiset.HashMultiSet;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.function.Supplier;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.apache.commons.collections4.CollectionUtils.isNotEmpty;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class CollectionsHelper {
    public static <E> Collection<E> intersect(final Iterable<? extends E> a, final Iterable<? extends E> b) {
        return CollectionUtils.intersection(a, b);
    }

    public static <E> Set<E> intersect(final Set<? extends E> a, final Collection<? extends E> b) {
        return b.stream().filter(a::contains).collect(Collectors.toSet());
    }

    public static <E> Set<E> intersectSet(final Set<? extends E> a, final Set<? extends E> b) {
        return SetUtils.intersection(a, b);
    }

    public static <E> Set<E> intersectSets(List<Set<? extends E>> setList) {
        if (CollectionUtils.isEmpty(setList)) {
            return Collections.emptySet();
        }

        Set<? extends E> first = setList.get(0);
        if (setList.size() == 1) {
            return new HashSet<>(first);
        }

        return first.stream()
                .filter(f -> isNotEmpty(setList) && setList.stream().allMatch(s -> s.contains(f)))
                .collect(Collectors.toSet());
    }

    public static <E> Set<E> intersectAnySets(List<Set<? extends E>> setList) {
        if (CollectionUtils.isEmpty(setList)) {
            return Collections.emptySet();
        }

        Set<? extends E> first = setList.get(0);
        if (setList.size() == 1) {
            return new HashSet<>(first);
        }

        Set<E> result = new HashSet<>();
        for (int i = setList.size() - 1; i >= 0; i--) {
            Set<? extends E> set = setList.get(i);
            setList.remove(set);
            set.stream()
                    .filter(f -> setList.stream().anyMatch(s -> s.contains(f)))
                    .forEach(result::add);

            if (setList.size() <= 1) {
                break;
            }
        }
        return result;
    }

    public static <E> Set<E> except(final Collection<? extends E> all, final Set<? extends E> except) {
        return except(all, except, Collectors.toSet());
    }

    public static <E, A, R> R except(final Collection<? extends E> all, final Set<? extends E> except, Collector<? super E, A, R> collector) {
        return all.stream()
                .filter(i -> !except.contains(i))
                .collect(collector);
    }

    public static <E, A, R> R except(final Collection<E> all, final Predicate<E> except, Collector<? super E, A, R> collector) {
        return all.stream()
                .filter(i -> !except.test(i))
                .collect(collector);
    }

    public static <E> Set<E> except(final Collection<? extends E> all, final Collection<? extends E> except) {
        return except(all, new HashSet<>(except));
    }

    public static <E> Set<E> findDuplicates(Collection<E> collection) {
        return new HashMultiSet<>(collection)
                .entrySet().stream()
                .filter(e -> e.getCount() > 1)
                .map(MultiSet.Entry::getElement)
                .collect(Collectors.toSet());
    }

    @SafeVarargs
    public static <E> Set<E> concat(Collection<E>... collections) {
        return Stream.of(collections)
                .flatMap(Collection::stream)
                .collect(Collectors.toSet());
    }

    @SafeVarargs
    public static <E> Set<E> concat(Stream<E>... streams) {
        return Stream.of(streams)
                .flatMap(Function.identity())
                .collect(Collectors.toSet());
    }

    public static <L extends List<E>, E> E firstOrDefault(L source) {
        return source.isEmpty() ? (E) null : source.get(0);
    }

    @SafeVarargs
    public static <L extends Collection<E>, E> L addAll(L source, E... item) {
        if (source == null) {
            return null;
        }
        source.addAll(Arrays.asList(item));
        return source;
    }

    public static <L extends Collection<E>, E> L removeIf(L source, Predicate<? super E> predicate) {
        if (source == null) {
            return source;
        }

        source.removeIf(predicate);
        return source;
    }

    public static <L extends Collection<E>, E> L safeAdd(L source, E item, Supplier<L> sourceSup) {
        L result = source == null ? sourceSup.get() : source;
        result.add(item);
        return result;
    }

    public static <T> List<List<T>> toMatrix(List<? extends T> items, int rows, int columns) {
        if(CollectionUtils.isEmpty(items)) {
            return List.of();
        }

        AtomicInteger atomicInteger = new AtomicInteger();
        List<List<T>> matrix = new ArrayList<>(rows);
        for (int i = 0; i < rows; i++) {
            List<T> row = new ArrayList<>(columns);
            matrix.add(row);
            for (int j = 0; j < columns; j++) {
                row.add(items.get(atomicInteger.getAndIncrement()));
                if (atomicInteger.get() > items.size() - 1) {
                    return matrix;
                }
            }
        }
        return matrix;
    }

    /*public static void main(String[] args) {
        System.out.println(intersectAnySets(new ArrayList<>(Arrays.asList(SetUtils.hashSet(3), SetUtils.hashSet(1,2,3), SetUtils.hashSet(4), SetUtils.hashSet(7,5), SetUtils.hashSet(567, 2))))
                .stream()
                .map(Number::toString)
                .collect(Collectors.joining(", ")));
    }*/
}
