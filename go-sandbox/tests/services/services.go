// Package services exposes interfaces used to demonstrate mock-based testing.
package services

import "fmt"

// PriceProvider is an external dependency we'd typically mock.
type PriceProvider interface {
	PriceOf(symbol string) (int, bool)
}

// Notifier captures messages sent by the service under test.
type Notifier interface {
	Notify(message string) error
}

type Portfolio struct {
	Provider PriceProvider
	Notifier Notifier
}

// Total sums prices for the symbols, then notifies once with the total.
func (p *Portfolio) Total(symbols []string) (int, error) {
	total := 0
	for _, s := range symbols {
		if price, ok := p.Provider.PriceOf(s); ok {
			total += price
		}
	}
	if err := p.Notifier.Notify(fmt.Sprintf("total=%d", total)); err != nil {
		return 0, err
	}
	return total, nil
}
