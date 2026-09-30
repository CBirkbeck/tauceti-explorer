# Red team: the EllipticCurveModularity blueprint

Claude Code, session `cc-c2c06b`, 30 September 2026. Target: `BP-EllipticCurveModularity`,
the packet by `cc-39fac3`, accepted by `REV-EllipticCurveModularity` (`cc-fb70e5`).
Issue #4435. I did neither.

**Result: five findings, one medium and four low.** The mathematics of Serre's deduction of
modularity from the classical Serre theorem is decomposed faithfully and survives attack. The
findings concern ownership, closure bookkeeping, one mis-stated decomposition, test strength
and the suggested file.

## Finding 1 (medium, duplicate): cross-level strong multiplicity one is a Tau Ceti target

The review added the lemma `R29.3/strong-multiplicity-one-across-levels`: newforms of weight
two, trivial character and levels dividing N that agree at almost all ℓ are equal, with equal
levels. Its proof re-derives this from an Atkin–Lehner–Li decomposition.

The Tau Ceti ModularForms roadmap already plans exactly this, more generally, as a named
target of its Layer 5: "Cross-level strong multiplicity one, for newforms (Miyake Thm
4.6.19) … a named target of this layer". Its reviewed audit lists the same target as absent
from the library. Under §15 a Tau Ceti roadmap is never re-planned, only imported. RS-06
already moved the fixed-level version out of R29.3 to that same layer.

**Fix:** delete the node, and cite ModularForms Layer 5, with a request for the weight-two
trivial-character case, where uniqueness across levels is used.

## Finding 2 (low): requested suppliers missing from their consumers' prerequisites

Nine request/consumer pairs across seven nodes have this gap. Each request names its consumer
in `neededBy`, but the consumer does not list the supplier among its prerequisites:

- ModularForms Layer 4 (finiteness of newforms, newform decomposition);
- ModularForms Layer 7 (Hecke's continuation, used in `l-function-continuation`);
- ModularForms Layer 8g (Galois conjugates of newforms);
- EllipticCurves Layer 4 (the Tate curve);
- JacobianChallenge Layer F (Abel–Jacobi).

§3's node-level closure fails as stated. The production graph already has the stage edges, so
no atlas link is lost. **Fix:** list the supplier stage in each of these prerequisite lists.

## Finding 3 (low): V_r(J₀(N)) without old-form multiplicities

The (ii) ⇒ (i) step of the final theorem writes `V_r(J₀(N)) ≅ ⊕_f ⊕_λ V_{f,λ}`. At N = 22
the left side has dimension 4, since X₀(22) has genus 2. The right side has dimension 2, since
the only newform of level dividing 22 is the level-11 one. The packet's own acceptance example
for S₂(Γ₀(22)) shows the old-form multiplicity σ₀(22/11) = 2.

The Jordan–Hölder conclusion is unaffected. **Fix:** state the decomposition with its
multiplicities σ₀(N/M), or speak only of constituents.

## Finding 4 (low): the exceptional-set tests do not discriminate

The three tests of `exceptional-primes` only check 2, 3, 5 and a bad prime. A definition that
drops the rational-isogeny and j-invariant clauses passes them all, and so does one that adds
extra primes. I computed two replacement cases exactly:

- **11a1:** Δ = −11⁵, v₁₁(j) = −5, and a rational point of order 5. So Σ = {2, 3, 5, 11},
  and **7 ∉ Σ**.
- **26b1:** the point (1, 0) has order 7, Δ = −2⁷·13 and v₂(j) = −7. So **7 ∈ Σ**, although
  7 > 5 and 7 ∤ 26.

**Fix:** add both as tests.

## Finding 5 (low): the suggested file does not carry the packet's tests and API

None of the twelve packet tests is in `suggested/EllipticCurveModularity.lean`. Eight of
the sixteen API items are absent even from its comments, and others appear only in
comments. The header says the missing statements "need objects not yet in
the pinned libraries (residual representations, newforms, J₀(N))". That is true of ρ̄, J₀(N)
and the conductor, which neither library defines. It is false of newforms: Tau Ceti's
`HeckeRing.GL2.Newform` is at the pin, and the packet cites it.

**Fix:** add the stateable tests and the newform-level API under the packet's names, taking the
level as an explicit parameter, and correct the header.

## What held up

- **Serre §4.6–4.7**, read in full, with the recorded hash. All the Serre excerpts are
  literal. The packet correctly extends Serre's p > 5 conductor criterion to p = 5, since the
  additive inertia images have order dividing 24.
- **The argument, node by node:**
  - the tame and wild conductor comparison;
  - the witness level, N(ρ̄) | M | N;
  - the nebentypus lemma;
  - the norm argument;
  - exact conductor, via Carayol;
  - the local factors in Mathlib's convention: split 1 − T, nonsplit 1 + T, additive 1;
  - the root number, w = eigenvalue of −W_N;
  - Manin's constant.
- **Tests I recomputed:**
  - 11a1: 5-torsion and a₂ = −2;
  - the dimensions of S₂(Γ₀(11)) and S₂(Γ₁(11));
  - modular degrees 1 for 11a1, 5 via the 5-isogeny to 11a3, and 2 for 37a1;
  - w = +1 for 11a1.
- **Baseline.** All 16 declarations exist, and I read the statements. `localPolynomial` uses
  the minimal model with a = q + 1 − #W′(κ). `LFunction` is the adic-completion Euler product.
  `Newform` carries a nebentypus. The fixed-level SMO is fixed-level only, as the packet says.
- **Closure.** `check_blueprint.py` passes, and all 35 node prerequisites resolve. The packet
  follows RS-06's owner assignments throughout.
- **Duplication.** No other roadmap plans modularity of E/ℚ; the other hits are consumers.

Not re-read: Carayol 1986, Faltings 1983, Deligne–Serre 1974 and Cremona. I checked their
excerpts only for consistency with the nodes.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-BP-EllipticCurveModularity.result.json`:
  ok.
- No Lean was compiled.
