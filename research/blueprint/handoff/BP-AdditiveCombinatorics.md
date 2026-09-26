# Handoff — BP-AdditiveCombinatorics

Issue #1037. Agent: **ChatGPT (GPT-6 Astra Pro)**. Session:
`gpt6-20260927-qm-7c9e`. Date: 27 September 2026.

## Status and scope of this submission

**Partial checkpoint, not a completed blueprint.** This submission adds this
handoff and `research/blueprint/suggested/AdditiveCombinatorics.lean`. It does
not create a packet or replace `data/decompositions/AdditiveCombinatorics.json`.
The existing reviewed decomposition, its ids, source readings and unresolved
proof inputs are preserved. No stage coverage status is changed.

The suggested file contains **2 definition signatures, 33 lemma signatures
and 16 example specifications**. Every body is `sorry`: **51 placeholders**,
not 51 proved declarations. There are no new packet nodes, packet API items,
packet tests, planets, requests or sourceIssues. Names below are proposed Lean
names, not allocated packet ids. Implementation status is **unchecked**.

The mathematical contribution is a finite-abelian Fourier interface with the
normalizations, comparison maps and elementary proofs made explicit. The
proofs below use the existing character orthogonality and duality results;
they do not assume a new Fourier inversion or convolution theorem. The
suggested file intentionally contains only this part of AC.0, not placeholder
claims to have completed the other layers.

## Ownership and inputs actually checked

The live issue has six stages, **AC.0–AC.5**, not an enlarged list of topics:
sumsets and energy; structure and randomness; progressions and removal; Gowers
norms and nilsequences; transference to primes; linear patterns and
multiplicative orthogonality.

The accepted RS-03 proposal narrows AC.0 to the missing generality and
normalization/comparison API for arbitrary finite abelian groups. Built energy,
convolution and Plunnecke–Ruzsa results must be imported. The proposal also says
that FF.1 consumes the missing generic Fourier interface from AC.0, while
field-specific trace and character comparisons stay in FF.1. The accepted
verdict is recorded in `research/blueprint/reviews/REV-RS-03.md`; the AC.0 and
FF.1 entries in `research/blueprint/restructure/RS-03.result.json` were read.

The giant `data/library-coverage.json` returned empty Contents API content,
including range reads. Raw-file access failed, and the Git blob reader returned
an oversized base64 payload. Instead I read the relevant **accepted source
audit**, `research/blueprint/audit/AUDIT-16.result.json`, including its AC.0–AC.2
entries, and the independent `RT-AUDIT-16.md`, which identifies that audit as
accepted and describes the coverage projection. This is not a claim to have
read the complete projected coverage file or repeated the audit of both
libraries. The accepted audit already distinguishes missing character-indexed
Fourier glue from existing characters, energy, cyclic Fourier analysis and
Peter–Weyl theory.

I read the opening of the integrated decomposition, including its Szemeredi
and Gowers-norm entries and its source-reading record. I have **not** independently
reverified all its sources or read all its entries. Hence it is left untouched,
not silently replaced by this narrower checkpoint. The area red-team report
was discovered, but its findings have not been incorporated in this pass.
The roadmap document, all touching link maps, supplier packets and the extra
Bennett–Siksek/Rahman source route still need their complete pass before packet
integration. No comprehensive absence claim about Tau Ceti is made here.

### Pinned source statements read directly

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
The Tau Ceti baseline remains `f790474821cf4256814db967cb154e7af3d0c369`,
but this pass does not add a fresh Tau Ceti declaration citation.

The following are baseline imports, **not work to re-prove**. For generated
additive declarations, the multiplicative statement and `to_additive` annotation
were read, rather than claiming to have compiled the generated declaration.

| Module at the Mathlib pin | Statements used or compared |
|---|---|
| [FiniteAbelian/PontryaginDuality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean) | `AddChar.complexBasis`, `AddChar.complexBasis_apply`, `AddChar.sum_apply_eq_ite`, `AddChar.card_eq`, `AddChar.zmod`, `AddChar.zmod_intCast`, `AddChar.zmodAddEquiv`, `AddChar.zmodAddEquiv_apply`. The whole file was read. |
| [FiniteAbelian/Orthogonality.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/FiniteAbelian/Orthogonality.lean) | `AddChar.wInner_cWeight_eq_boole`, `AddChar.instFintype`; the whole file was read. Character orthogonality already uses probability normalization. |
| [Fourier/ZMod.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Fourier/ZMod.lean) | `ZMod.dft`, `ZMod.dft_apply`, `ZMod.dft_apply_zero`, `ZMod.dft_dft`; lines 1–185 read. This transform uses ordinary counting measure. |
| [InfiniteSum/DiscreteConvolution.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/InfiniteSum/DiscreteConvolution.lean) | `DiscreteConvolution.addConvolution`, `addRingConvolution`, `addRingConvolution_apply`, `single_addRingConvolution`, the zero/addition/scalar/commutativity interfaces in the ranges read. Lines 1–230 and 310–455 were read, not the entire intervening section. |
| [Additive/Energy.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Combinatorics/Additive/Energy.lean) | `Finset.addEnergy`, `Finset.addEnergy_eq_sum_sq`, `Finset.le_card_add_mul_addEnergy`, from the multiplicative declarations and their additive annotations; lines 32–165 read. |

The generic finite-sum, finite-fiber, complex-conjugation and basis-coordinate
lemmas used in the proofs still need declaration-level index matching. The
suggested file is therefore **not yet a packet with every prerequisite linked
to a pinned declaration**. The source-paper reading, locator/excerpt work and
PDF hashes required by PROTOCOL have not been completed in this pass. No new
paper hash or source-wide closure is claimed.

## Mathematical conventions

Let G be a finite abelian group, written additively, and N = |G|. Its identity
implies N > 0. Let G-hat be its group of complex-valued characters. Do not pick
an identification of G with G-hat: none is needed here. Each character has
absolute value one, sends zero to one, and satisfies

    chi(x+y) = chi(x) chi(y),
    chi(-x) = conjugate(chi(x)).

For f,g : G -> C define

    F(f)(chi) = (1/N) sum_x f(x) conjugate(chi(x)),
    C(f,g)(x) = (1/N) sum_y f(y) g(x-y).

Thus G has probability counting measure, while the dual has ordinary counting
measure. We use `fourier` and `nconv` for F and C in the suggested file. These
are an API adapter and normalization, not a second character theory or a
replacement for the general discrete convolution.

The two baseline orthogonality formulas are

    (O1) (1/N) sum_x chi(x) conjugate(psi(x)) = [chi = psi],
    (O2) sum_chi chi(x-y) = N [x = y].

Here [P] is one when P holds and zero otherwise. O1 follows directly from
`wInner_cWeight_eq_boole`, with the harmless conjugation/argument order adjusted.
O2 is `sum_apply_eq_ite` and the additive-group identity x-y=0 iff x=y.
Neither becomes a new blueprint node.

## Complete elementary proof worksheet

### 1. Definition specifications and linear API

`fourier_apply` and `nconv_apply` are exactly the displayed formulas. A safe
implementation can use the existing normalized finite average, or the scalar
multiple of an ordinary finite sum. Its equality with that average must be
part of the adapter, not an implicit convention.

`fourier_zero`, `fourier_add` and `fourier_smul` follow by distributivity of
finite sums and complex scalar multiplication. For the point mass delta_a,

    F(c delta_a)(chi) = c conjugate(chi(a))/N.

Only the a term survives, proving `fourier_single`. Applying O1 gives

    F(psi)(chi) = [chi = psi],

which is `fourier_character`. In particular the transform of the constant
function one is one at the trivial character and zero elsewhere. There is
no extra factor N in this formula.

### 2. Inversion, coordinates and injectivity

Interchange the two finite sums:

    sum_chi F(f)(chi) chi(x)
      = (1/N) sum_y f(y) sum_chi chi(x-y)
      = f(x),

by O2. This proves `fourier_inversion`. Notice that the inverse is a sum,
**not an average**. The existing basis `AddChar.complexBasis G` has chi as
its chi-th basis vector. The displayed expansion and uniqueness of basis
coordinates therefore give `fourier_eq_basis_repr`. Thus the new transform
is precisely the existing basis-coordinate map expressed as scalar Fourier
coefficients, not a new choice of basis. Applying inversion pointwise to equal
transforms proves `fourier_injective`.

### 3. Parseval and Plancherel

Insert the expansions from inversion for f and g into their inner product,
interchange finite sums, and apply O1:

    (1/N) sum_x f(x) conjugate(g(x))
      = sum_chi F(f)(chi) conjugate(F(g)(chi)).

This proves `fourier_parseval`. Take g=f, use
z conjugate(z) = |z|^2, and take real parts to obtain
`fourier_plancherel`. This is a character-coordinate compatibility theorem.
It neither declares Peter–Weyl missing nor asks another roadmap to re-prove
Parseval for compact groups.

### 4. Compare to the existing discrete convolution

For fixed x, the map

    y |-> (y, x-y)

is a bijection from G to the additive fiber {(a,b) : a+b=x}; its inverse is
first projection. The fiber is finite. Reindex the finite version of the
existing `addRingConvolution_apply` sum by this bijection. It becomes
sum_y f(y)g(x-y). Multiplication by 1/N proves
`nconv_eq_addRingConvolution`.

This comparison, with the existing convolution API, supplies commutativity,
addition and zero laws. Alternatively, each follows immediately by finite
sum reindexing and distributivity, which is useful when choosing the smallest
imports. Explicitly, y -> x-y exchanges the factors for `nconv_comm`;
distributing either input gives `nconv_add_left` and `nconv_add_right`;
a zero input makes every summand zero.

For associativity the left side expands to

    N^(-2) sum_{a,b} f(a) g(b) h(x-a-b),

after replacing the outer variable y by a+b. The right side gives the same
sum after replacing its inner variable by b. All changes of variables are
bijections with the displayed inverse obtained by subtraction. This proves
`nconv_assoc` without an analytic Fubini or convergence assumption.

The point-mass calculation gives

    C(c delta_a, d delta_b) = (cd/N) delta_(a+b).

This is `nconv_single`. The unit is **N delta_0**, not delta_0. Substitute
this point mass into the first input to obtain `nconv_unit_left`; the right
unit follows by commutativity or the same computation. Conversely
C(delta_0,delta_0)=delta_0/N, an exact counterexample to the wrong unit
whenever N>1.

### 5. Fourier transform of convolution

Expand the two normalized sums and put z=x-y:

    F(C(f,g))(chi)
      = N^(-2) sum_{y,z} f(y)g(z) conjugate(chi(y+z))
      = ((1/N) sum_y f(y) conjugate(chi(y)))
        ((1/N) sum_z g(z) conjugate(chi(z))).

The change of variables (x,y) <-> (y,z) is bijective, and multiplicativity
of chi factors its value. This proves `fourier_nconv`. There is no remaining
factor N: both definitions have been normalized.

### 6. Translation, modulation, reflection and conjugation

All four identities retain the frequency character, not a chosen cyclic
coordinate. In the first, translation means f(x-a), not f(x+a).

    F(x |-> f(x-a))(chi) = conjugate(chi(a)) F(f)(chi),
    F(x |-> psi(x)f(x))(chi) = F(f)(chi/psi),
    F(x |-> f(-x))(chi) = F(f)(chi^(-1)),
    F(x |-> conjugate(f(x)))(chi) = conjugate(F(f)(chi^(-1))).

For translation substitute y=x-a and factor chi(y+a). For modulation use
conjugate((chi/psi)(x)) = conjugate(chi(x)) psi(x), since |psi(x)|=1.
For reflection substitute y=-x. For conjugation take the conjugate of the
defining sum and use |chi(x)|=1. These prove the four corresponding API lemmas
without assuming f is real-valued.

### 7. Equivariance and quotient groups

For an additive equivalence e:G->H, normalized sums are invariant under e:
the unnormalized sums reindex by a bijection and |G|=|H|. Substitution in the
definition proves `fourier_equiv` for the pullback character chi composed with e.
There is no inverse or dual identification hidden in its statement.

For a **surjective** homomorphism q:G->H, put K=ker(q), m=|K|. Each fiber
q^(-1)(h) is a translate of K: choose x with q(x)=h and use k -> x+k, inverse
y -> y-x. Thus |G|=m|H| and, for every function u on H,

    (1/|G|) sum_x u(q(x)) = (1/|H|) sum_h u(h).

Apply this to u(h)=f(h)conjugate(chi(h)) to prove `fourier_quotient`.
Surjectivity must not be erased: otherwise the left side averages over the
image, not all of H.

For an arbitrary q, suppose a belongs to its kernel and chi(a) is not one.
The pullback f composed with q is unchanged by translation by a. The translation
identity gives F(f composed with q)(chi) = conjugate(chi(a)) times itself.
Because conjugate(chi(a)) is not one, the coefficient is zero. This proves
`fourier_quotient_zero`; **surjectivity is not needed for this vanishing lemma**.
These two statements are kept separate instead of hiding the different
hypotheses in one blanket naturality assertion.

### 8. Cyclic comparison and the sign check

For N>0, `AddChar.zmodAddEquiv r` sends x to exp(2 pi i xr/N), the same
value as `ZMod.stdAddChar (x*r)`. `zmod_character_comparison` is the adapter
between these two existing constructions. Prove it by taking integer
representatives, using the explicit character formulas, and checking
independence of representatives by the integer periods of the exponential.
The actual source declarations show that this is a positive-exponent
character, not its inverse.

Conjugating the character in F then gives the negative-exponent kernel in
`ZMod.dft_apply`. Hence

    F(f)(AddChar.zmodAddEquiv r) = (1/N) ZMod.dft(f)(r).

This is `fourier_zmod`. On Z/4, f=delta_1 and r=1 give **-i/4**. This one
value detects both the sign and the missing-normalization errors. The case
N=1 is included; N=0 is excluded by `[NeZero N]`, not treated as a finite
cyclic group of size zero.

### 9. Fourier energy is a comparison, not a new energy definition

For finite subsets A,B of G, let r(t) count the pairs (a,b) in A x B with
a+b=t. The existing `Finset.addEnergy_eq_sum_sq` gives

    E(A,B) = sum_t r(t)^2.

By the definition of normalized convolution,
C(1_A,1_B)(t)=r(t)/N. Consequently

    (1/N) sum_t |C(1_A,1_B)(t)|^2 = E(A,B)/N^3.

Apply Plancherel and the convolution-product identity to obtain

    E(A,B) = N^3 sum_chi |F(1_A)(chi)|^2 |F(1_B)(chi)|^2.

This proves `fourier_energy` and explains the **third power** of N. It holds
with either set empty. At A=B=G both sides are N^3; at A=B={0} both sides
are one. The existing Cauchy–Schwarz energy bound remains an imported theorem;
this checkpoint does not create another energy definition or re-plan Ruzsa
calculus.

## Intended uses and API coverage

The following are intended consumers within the current roadmap, not claims
that their proofs or sources were read in this pass.

For `fourier`: AC.0 needs inversion and the energy comparison; AC.1 needs
translation/modulation and quotient compatibility for spectra, Bohr sets and
density increments; AC.3 needs an accurately normalized starting point for the
U^2/Fourier comparison; FF.1 needs the field-specific character adapter on top
of this generic interface. Its API therefore includes linearity, point masses,
character values, inversion/injectivity, basis compatibility, Parseval,
convolution, symmetry, quotient/equivalence naturality and the cyclic adapter.

For `nconv`: AC.0 needs representation counts and energy; AC.1 needs iterative
convolution and smoothing; the Fourier-product identity supplies spectral
calculations; FF.1 can reuse it without a field-specific convolution definition.
Its API includes the existing-discrete-convolution comparison, commutativity,
associativity, distributivity, zero, the point-mass formula, the correctly scaled
two-sided unit and the Fourier-product formula. Each definition has eight
example specifications in the suggested file, including a degenerate value,
a computed value and agreement with an existing library notion.

A future packet must promote each consumed API lemma to a node, allocate ids
without colliding with the existing decomposition or reserved ids, and place
each edge against its actual prerequisites. This file does not claim that this
administrative and source-locator work has already been done.

## Checks actually executed

**No Lean executable or Lake executable was found in this environment.** No
Lean compilation, dependency build or repository packet checker was run. The
51 `sorry` bodies are explicit planning placeholders, not evidence of compiling
statements. In particular, the generated additive convolution names, character
coercions, the basis-coordinate expression and the two cyclic character
constructors should be compile-checked at the pin before promotion.

The standard-library Python program below **was executed**. It works in the
exact cyclotomic algebra Q[z]/(z^4-z^2+1), with conjugation z -> z^(-1), and
uses Fraction coefficients throughout. Thus it has no floating-point tolerance.
It checked:

- **11 groups**, including Z/2 x Z/2, (Z/2)^3, (Z/3)^2 and Z/4 x Z/2;
- **579 ordered point-mass pairs**, each for inversion and Parseval;
- **5,589 convolution coefficient identities**;
- **40 subsets** for the Fourier-energy normalization;
- **2 quotient-basis tests** for Z/4 -> Z/2, plus the non-real -i/4 sign sentinel.

Bilinearity extends the tested point-mass identities to all functions on each
of those particular finite groups, but this is still a regression program,
not a Lean proof of the general theorem or a check of the suggested Lean
elaboration. It is independent of the `sorry` specifications.

```python
from fractions import Fraction as Q
from itertools import product

# Exact arithmetic in Q[z]/(z^4-z^2+1), with z a primitive twelfth root.
Z = (Q(0),) * 4
ONE = (Q(1), Q(0), Q(0), Q(0))

def plus(a, b):
    return tuple(x + y for x, y in zip(a, b))

def scale(a, c):
    return tuple(c * x for x in a)

def times(a, b):
    t = [Q(0)] * 7
    for i in range(4):
        for j in range(4):
            t[i+j] += a[i] * b[j]
    for i in range(6, 3, -1):
        t[i-2] += t[i]
        t[i-4] -= t[i]
    return tuple(t[:4])

def total(xs):
    s = Z
    for x in xs:
        s = plus(s, x)
    return s

roots = [ONE]
for j in range(11):
    roots.append(times(roots[-1], (Q(0), Q(1), Q(0), Q(0))))
assert times(roots[-1], (Q(0), Q(1), Q(0), Q(0))) == ONE

def conj(a):
    return total(scale(roots[(-i) % 12], c) for i, c in enumerate(a))

def norm2(a):
    return times(a, conj(a))

def points(ms):
    return list(product(*(range(m) for m in ms)))

def add(a, b, ms):
    return tuple((x+y) % m for x, y, m in zip(a, b, ms))

def char(a, r, ms):
    return roots[sum((12//m)*x*y for x, y, m in zip(a, r, ms)) % 12]

def ft(f, ms):
    es = points(ms)
    n = len(es)
    return [scale(total(times(v, conj(char(a, r, ms)))
                        for a, v in zip(es, f)), Q(1, n)) for r in es]

matrix_checks = conv_checks = 0
for ms in [(), (2,), (3,), (4,), (6,), (2,2), (2,2,2),
           (3,3), (4,2), (6,2), (4,3)]:
    es = points(ms)
    n = len(es)
    cols = [ft([ONE if x == a else Z for x in es], ms) for a in es]
    for i, a in enumerate(es):
        for j, b in enumerate(es):
            inv = total(times(cols[i][r], char(b, es[r], ms)) for r in range(n))
            assert inv == (ONE if a == b else Z)
            ip = total(times(cols[i][r], conj(cols[j][r])) for r in range(n))
            assert ip == (scale(ONE, Q(1, n)) if a == b else Z)
            matrix_checks += 1
            out = es.index(add(a, b, ms))
            for r in range(n):
                assert times(cols[i][r], cols[j][r]) == scale(cols[out][r], Q(1, n))
                conv_checks += 1
    assert ft([ONE] * n, ms) == [ONE] + [Z] * (n-1)
    assert all(v == ONE for v in ft([scale(ONE, n)] + [Z] * (n-1), ms))

energy_checks = 0
for ms in [(4,), (2,2), (3,)]:
    es = points(ms)
    n = len(es)
    for bits in product((0, 1), repeat=n):
        A = [a for a, b in zip(es, bits) if b]
        counts = {x: 0 for x in es}
        for a in A:
            for b in A:
                counts[add(a, b, ms)] += 1
        energy = sum(t*t for t in counts.values())
        spectrum = ft([scale(ONE, b) for b in bits], ms)
        spectral = scale(total(times(norm2(v), norm2(v)) for v in spectrum), n**3)
        assert spectral == scale(ONE, energy)
        energy_checks += 1

for f in ([ONE, Z], [Z, ONE]):
    big = ft([f[x % 2] for x in range(4)], (4,))
    small = ft(f, (2,))
    assert big == [small[0], Z, small[1], Z]
assert ft([Z, ONE, Z, Z], (4,))[1] == scale(roots[9], Q(1, 4))
assert (matrix_checks, conv_checks, energy_checks) == (579, 5589, 40)
print(matrix_checks, conv_checks, energy_checks)
```

## Continuation without losing the existing work

1. Complete the required read of the reviewed coverage projection, current
   roadmap/atlas extract, all touching link maps, reserved ids, supplier packets
   and the entire integrated decomposition. This is necessary before asserting
   collision-free ids or a complete baseline audit. The accepted audit is useful
   evidence but not a substitute for reviewing current supplier interfaces.
2. Acquire and read the actual finite-abelian Fourier source passages, with
   verified locators, short excerpts and hashes where obtainable. Match the
   elementary proof steps above to exact finite-sum and basis declarations.
   Compile the suggested signatures at Mathlib `082e2d3`; no such check has
   been done here.
3. Integrate only genuinely missing normalization/comparison declarations into
   a packet that preserves the existing good nodes and ids. Do not replace the
   transference decomposition with just this AC.0 worksheet. Reconcile the
   upstream-style roadmap document and API/test entries at the same time.
4. AC.1 remains outside this checkpoint: BSG, source-scoped Freiman theory,
   Bohr sets and quantitative density/arithmetic-regularity inputs still need
   their full source and dependency decomposition.
5. AC.2 must retain the qualitative Roth baseline rather than re-prove it.
   The added Bennett–Siksek route asks specifically for the stronger **Rahman
   double-exponential numerical threshold**. Its source edition and proof have
   not been acquired in this pass; do not substitute the pinned tower threshold
   or claim that this Fourier interface supplies it. General Szemeredi,
   Varnavides and the chosen removal/correspondence route remain separate work.
6. AC.3–AC.4 keep the existing Gowers/transference work and its gaps. Read and
   resolve the area red-team findings before selecting the general Szemeredi
   proof route. This checkpoint establishes no higher inverse theorem,
   nilsequence result, prime majorant, relative Szemeredi theorem or prime-pattern
   theorem. AC.5 and its multiplicative-orthogonality source routes are untouched.
7. Only after those integrations run the packet checker with the pinned index,
   audit proposed planets and API/test coverage, and update stage statuses to
   precisely the level actually achieved. No layer is declared closed here.
