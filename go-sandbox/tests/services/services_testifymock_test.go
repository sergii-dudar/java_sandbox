// Tests using `github.com/stretchr/testify/mock`.
// mock.Mock-based fakes record calls and let you assert on them.
package services

import (
	"errors"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/mock"
)

type mockPrices struct{ mock.Mock }

func (m *mockPrices) PriceOf(symbol string) (int, bool) {
	args := m.Called(symbol)
	return args.Int(0), args.Bool(1)
}

type mockNotifier struct{ mock.Mock }

func (m *mockNotifier) Notify(message string) error {
	return m.Called(message).Error(0)
}

func TestPortfolio_Total_HappyPath(t *testing.T) {
	prices := &mockPrices{}
	prices.On("PriceOf", "AAPL").Return(180, true).Once()
	prices.On("PriceOf", "MSFT").Return(420, true).Once()

	notes := &mockNotifier{}
	notes.On("Notify", "total=600").Return(nil).Once()

	p := &Portfolio{Provider: prices, Notifier: notes}
	got, err := p.Total([]string{"AAPL", "MSFT"})

	assert.NoError(t, err)
	assert.Equal(t, 600, got)
	prices.AssertExpectations(t)
	notes.AssertExpectations(t)
}

func TestPortfolio_Total_MissingPriceIsZero(t *testing.T) {
	prices := &mockPrices{}
	prices.On("PriceOf", mock.Anything).Return(0, false)

	notes := &mockNotifier{}
	notes.On("Notify", "total=0").Return(nil)

	p := &Portfolio{Provider: prices, Notifier: notes}
	got, err := p.Total([]string{"X", "Y"})

	assert.NoError(t, err)
	assert.Equal(t, 0, got)
}

func TestPortfolio_Total_NotifierError(t *testing.T) {
	prices := &mockPrices{}
	prices.On("PriceOf", mock.Anything).Return(1, true)

	notes := &mockNotifier{}
	notes.On("Notify", mock.Anything).Return(errors.New("offline"))

	p := &Portfolio{Provider: prices, Notifier: notes}
	_, err := p.Total([]string{"A"})
	assert.EqualError(t, err, "offline")
}
