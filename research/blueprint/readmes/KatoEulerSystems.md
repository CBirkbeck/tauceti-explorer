# Kato classes and explicit reciprocity for modular forms

Blueprint for the roadmap `KatoEulerSystems`, job `BP-KatoEulerSystems` (issue #766).
Packet: `research/blueprint/packets/KatoEulerSystems.json`. Suggested Lean file:
`research/blueprint/suggested/KatoEulerSystems.lean`. Handoff:
`research/blueprint/handoff/BP-KatoEulerSystems.md`.

**Status: partial.** All five layers in scope carry the coverage status the reviewed decomposition gave them,
with its `remaining` lists kept verbatim and a note per layer added. The packet is not closed because it has an
open request and eight gaps, most of them sections of the source that were not read. The packet has
22 nodes, 33 API items and 21 unit tests, cites 30 declarations of the pinned libraries, records 8 gaps and
makes one request to another roadmap.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

Every source is freely available and was opened and read; the sections read are listed in the packet.

- **`kato-2004-asterisque-295`** — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*. Asterisque 295 (2004), pp. 117-290; Numdam digitisation AST_2004__295__117_0 (inspected 2026-09-15)
  <https://www.numdam.org/item/AST_2004__295__117_0.pdf>, read 2026-09-15.
  SHA-256 `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d`.
- **`rubin-euler-systems-draft`** — Karl Rubin, *Euler systems (author's course draft of the Annals of Mathematics Studies 147 monograph)*. Author draft distributed with the 1999 Arizona Winter School notes (inspected 2026-09-15); chapter/section numbering agrees with the published monograph
  <https://swc-math.github.io/notes/files/99RubinES.pdf>, read 2026-09-15.
  SHA-256 `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`.

## What this packet is, and what it rests on

This roadmap already had a **reviewed integrated decomposition** of Kato's Astérisque 295, accepted after
an independent review. This packet keeps every one of its 22 node identifiers, statements, hypotheses,
proof steps, acceptance tests and verified locators, and adds what a blueprint packet needs and a
decomposition does not: prerequisites resolved to the pinned libraries, to nodes of this packet or to a
named supplier stage; an API outline with unit tests for each of the seven constructions; planets; and a
coverage record per layer.

**What was checked in this session.** Both sources of this roadmap are freely available, and both were
re-downloaded here: Kato's paper from Numdam and Rubin's Euler systems draft from the Arizona Winter School
page. Both SHA-256 hashes reproduce the recorded ones byte for byte. The prose of the five results the last
layer turns on was re-read directly in the text layer and agrees with the decomposition: Theorem 12.4 with
its three parts and the hypothesis on the residual representation in (3); the existence and uniqueness
clause of Theorem 12.5(1); Theorem 13.6 with its attribution to Ash and Stevens and its exact generators;
Rohrlich's finiteness statement; and Proposition 13.7 with the four results its proof cites.

**What was not.** The displayed formulas are garbled in the Numdam text layer - the independent review said
so and read those pages from page renderings instead - and no page-rendering tool was available in this
session. Every displayed formula in this packet therefore rests on the review's reading and not on one made
here. That is recorded in the source entry and as a gap, so that a reviewer can tell the two kinds of
evidence apart.

The reviewed library audit records **all five layers as not built**. Nothing here duplicates the libraries.
One request is filed:

- **`EulerSystemsAndKolyvaginSystems:ES.8`** — The Iwasawa variation of the generic Euler-system machine: an inverse-limit bound over a Lambda-algebra for an Euler system satisfying the standard hypotheses, in the form the source's Theorem 13.4 uses. Kato does not prove that theorem; he imports it, and this packet imports it in turn. The hypothesis packages of the source's theorem and of Rubin's Theorem II.3.3 are not literally the same, which the integrated decomposition records as a gap and which this packet carries forward, so the supplier must say which package it provides.

## Layers

---

## L0 Siegel units

**Coverage: partial.** Kato Section 1 and Lemma 2.12: the c-normalised theta function with its divisor and q-expansion, the Siegel units on Y(N) with their c-independent rationalisation, the GL_2(Z/N)-equivariance and the distribution relation, and the degeneracy-map product formula. The reviewed library audit records the layer as not built: neither pinned library has Siegel functions, their transformation laws, their divisors at the cusps or the c-normalisation.

**Remaining in this layer:**

- Kato 1.3(3) and 1.9: the q-expansion/analytic presentation of c-theta and of g_{a/N,b/N} was read as a statement but its derivation (via [KL] Kubert-Lang) was not; the integrality of the q-expansion coefficients and the exact leading exponent i_0 = 1/12 - a/(2N) + a^2/(2N^2) need a separate reading of [KL] or of Kato 1.10's remaining parts.
- Kato 1.3(4) (behaviour of c-theta under isogenies of degree prime to c) was read as a statement; its proof was not located in 1.10.
- The stage text asks for 'arithmetic descent and Galois action' of the Siegel units over the total constant field Q(zeta_N). Kato 1.6 and 1.8 give the GL_2(Z/N)-action and the determinant twist; the descent of the appropriate powers to units over Q (as opposed to over Q(zeta_N)) was not traced in the source.
- The stage text asks for 'independence of the auxiliary choices after multiplication by the explicitly named Euler/smoothing factors'. Kato 1.4 gives independence of c after inverting c^2-1; the integral (non-rationalised) comparison of two choices c, c' via the operator (c^2 - <c>) is stated in 2.2 but its integral form was not checked.

Everything in Kato's construction starts from one function. The `c`-normalised theta function of
an elliptic curve is a unit away from the `c`-torsion, and its pullbacks along torsion sections are the Siegel
units `g_{a,b}` on `Y(N)`. The auxiliary `c` is the price of integrality, and it is paid back: two admissible
choices agree after inverting `c^2 - 1`, which is the rationalisation this layer records.

Three properties of these units carry the whole Euler system: the `GL_2(Z/N)`-equivariance, the distribution
relation along degeneracy maps, and the product formula of Kato's Lemma 2.12. The reviewed audit records Siegel
functions, their transformation laws and their divisors at the cusps as absent from both pinned libraries.

**Planets of this layer** (2): *The c-normalised theta function*, *Siegel units*.

### Nodes (4)

#### `theta-function-c-normalised` — The c-normalised theta function of an elliptic curve

*construction.* **Planet:** *The c-normalised theta function*.

**Statement.** For an elliptic curve E over a scheme S and an integer c prime to 6 there is a unique unit c-theta_E in O(E \ E[c])^x such that (i) its divisor is c^2*(0) - E[c], where (0) is the zero section and E[c] = Ker(c: E -> E), both taken as Cartier divisors on E, and (ii) N_a(c-theta_E) = c-theta_E for every integer a prime to c, N_a being the norm along multiplication by a. It satisfies the c,d-compatibility of Prop. 1.3(2), the analytic q-product formula of Prop. 1.3(3), and is preserved by the norm along any isogeny of degree prime to c (Prop. 1.3(4)).

**Hypotheses.**

- E is an elliptic curve over an arbitrary base scheme S (no smoothness or affineness assumption beyond that of an elliptic curve)
- c is an integer prime to 6; the exclusion of 2 and 3 is used twice in the proof (a = 2 and a = 3 are the auxiliary multipliers)
- E[c] and c^2*(0) are taken as Cartier divisors, so the divisor condition is an equality of Cartier divisors, not merely of cycle classes
- the norm maps N_a are those of the finite locally free map a: E \ E[ac] -> E \ E[c]

**Construction, or proof, in steps.**

1. Uniqueness. If f, g both satisfy (i) and (ii) then g = u f with u in O(S)^x an invertible constant, because they have the same divisor. For a prime to c, N_a(u f) = u^{a^2} f since a: E -> E has degree a^2; hence u^{a^2 - 1} = 1. Taking a = 2 and a = 3 gives u^3 = 1 and u^8 = 1, hence u = 1.
2. Existence, local step. By uniqueness one may work locally on S. The divisor c^2*(0) - E[c] has degree 0, so by Abel's theorem it is principal as soon as its image under Pic(E)^{deg 0} = E(S) vanishes. That image is invariant under multiplication by every a prime to c, because a^* fixes the divisor; taking a = 2 forces the image to be 0.
3. Normalisation of the local solution. A local f with divisor c^2*(0) - E[c] satisfies N_a(f) = u_a f for constants u_a, since N_a(f) has the same divisor. Commutativity N_a N_b = N_b N_a gives u_b^{a^2-1} = u_a^{b^2-1}. Rescaling f by the explicit monomial in u_2, u_3 exhibited in 1.10 produces g with N_a(g) = g for all a prime to c, i.e. (i) and (ii).
4. Globalisation. Uniqueness makes the local solutions glue, giving c-theta_E over S.
5. Part (2) (the c,d-compatibility) and part (4) are proved by the same 'same divisor + invariance under N_2 and N_3 forces the ratio to be 1' argument: the ratio u of the two sides satisfies u^4 = u and u^9 = u, hence u = 1.

**Acceptance.**

- Check that the degree-0 condition really holds: deg(c^2*(0)) = c^2 and deg(E[c]) = c^2, so the divisor has degree 0; Kato's Remark 1.5 records that no c-free analogue theta_E exists precisely because (0) has degree 1.
- Check that c prime to 6 cannot be weakened to c prime to 2 alone: the uniqueness argument needs u^3 = 1 and u^8 = 1 simultaneously.
- Check the analytic formula of 1.3(3) reduces, for E = C/(Z*tau + Z), to the stated q-product with the leading factor q^{(c^2-1)/12}.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `cTheta` | data | The c-normalised theta function of an elliptic curve, for an integer c prime to 6 and to the level. |
| `cTheta_divisor` | characterisation | Its divisor, supported on the c-torsion, which is what makes it a unit away from that locus. |
| `cTheta_qExpansion` | data | Its q-expansion, with the leading exponent the source records. |
| `cTheta_isogeny` | compatibility | Its behaviour under an isogeny of degree prime to c. |
| `cTheta_independent_after_inverting` | relation | Two choices of c agree after inverting c squared minus one, which is what the rationalisation below uses. |

**Uses.**

- `KatoEulerSystems:L0/siegel-units-and-c-independent-rationalisation`: the Siegel units are the pullbacks of this function along torsion sections
- `KatoEulerSystems:L0/siegel-unit-degeneracy-product-formula`: the product formula is proved from the divisor and the isogeny behaviour

**Unit tests.** A plausible wrong definition fails one of these.

- `divisor_is_c_torsion`: The divisor is supported on the kernel of multiplication by c, with the multiplicities the source records; a function with a different divisor is not this one.
- `c_prime_to_six`: The normalisation needs c prime to 6 and to the level; for c = 2 or 3 the construction does not produce a unit.
- `two_choices_of_c`: Two admissible choices of c give functions that agree after inverting c squared minus one, and not before; an implementation that asserts equality integrally is wrong.

**Prerequisites.**

- `mathlib:UpperHalfPlane`
- `mathlib:PowerSeries`
- `mathlib:Units`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, Prop. 1.3(1), printed p. 121.

  > There exists a unique element c6E of 0(E \ CE) satisfying the following conditions (i) (ii). (i) c6E has the divisor cz(0) - CE on E, where (0) denotes the zero section of E regarded as a Cartier divisor on E and CE = Ker(c : E -> E) is also regarded as a Cartier divisor on E. (n) Na(ceE) = c0E for any integer a which is prime to c

  The OCR renders c-theta_E as 'c6E'/'ceE' and c^2*(0) as 'cz(0)'; the sentence gives exactly the uniqueness statement, the divisor condition as Cartier divisors, and the norm-invariance condition quoted in the node statement.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 1.10 (proof of Prop. 1.3(1)), printed p. 124.

  > For an integer a which is prime to c, we have g = Na(g) = Na(uf) = ua f (since a : E -> E is of degree a2) and hence ua ~x = 1. By taking a = 2 (resp. a = 3), we have u3 = 1 (resp. u8 = 1). Hence u = 1.

  This is the uniqueness step verbatim (with 'ua' for u^{a^2} and 'ua ~x' for u^{a^2-1}); it justifies the first proofStep and the acceptance item about c being prime to 6.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 1.10 (existence), printed p. 124.

  > For this, by "Abel's theorem" it is sufficient to prove that the image of c2(0) - CE under the isomorpism of Abel Pic(E')deg_0 -> E(S) is zero.

  Confirms that the existence proof runs through Abel's theorem and the degree-0 class, as recorded in the second proofStep.

#### `siegel-units-and-c-independent-rationalisation` — Siegel units on Y(N) and their c-independent rationalisation

*construction.* **Planet:** *Siegel units*.

**Statement.** Let N >= 3 and let E be the universal elliptic curve on the modular curve Y(N) over Q (the fine moduli of (E,e_1,e_2) with (e_1,e_2) a Z/N-basis of E[N]). For (alpha,beta) in (Q/Z)^2 \ {(0,0)} with N*alpha = N*beta = 0, write (alpha,beta) = (a/N,b/N) and let iota_{alpha,beta} = a*e_1 + b*e_2 : Y(N) -> E \ E[c]. The Siegel unit is c-g_{alpha,beta} = iota_{alpha,beta}^*(c-theta_E) in O(Y(N))^x, defined whenever c is prime to 6 and to the orders of alpha and beta. Choosing c with (c,6)=1 and c = 1 mod N, the element g_{alpha,beta} = (c-g_{alpha,beta})^{1/(c^2-1)} in O(Y(N))^x tensor Q is independent of that choice, and for every c with (c,6N)=1 one has c-g_{alpha,beta} = (g_{alpha,beta})^{c^2} * (g_{c*alpha,c*beta})^{-1} in O(Y(N))^x tensor Q. The two families are compatible with the inclusions O(Y(N)) into O(Y(N')) for N | N', so they define elements of the direct limits.

**Hypotheses.**

- N >= 3, so that Y(N) is a fine moduli scheme and the universal curve exists; Y(N) is a smooth irreducible affine curve over Q whose total constant field is Q(zeta_N), not Q
- (alpha,beta) is not (0,0), and c is prime to 6 and to the orders of alpha and beta; this is exactly what makes the image of a*e_1 + b*e_2 disjoint from E[c], so that the pullback is defined
- the rationalisation inverts c^2 - 1, so it lives in O(Y(N))^x tensor Q and not in O(Y(N))^x; only c-g_{alpha,beta} is an honest unit

**Construction, or proof, in steps.**

1. Pull back c-theta_E along the section iota_{alpha,beta}; the section misses E[c] by the coprimality hypothesis on c, so the pullback of a unit on E \ E[c] is a unit on Y(N).
2. Prop. 1.3(2) (the c,d-compatibility of the theta functions) gives the displayed relation between c-g and g, and hence that (c-g_{alpha,beta})^{1/(c^2-1)} does not depend on the choice of c with c = 1 mod N.
3. Independence of N: the elements are compatible under the finite etale transition maps Y(N') -> Y(N), which on moduli send (E,e_1,e_2) to (E,(N'/N)e_1,(N'/N)e_2).

**Acceptance.**

- Verify that Q(zeta_N) sits in the constant field of Y(N) and that the complex embedding used later is the one determined by the points nu(tau) for tau in the upper half plane, with zeta_N = exp(2*pi*i/N) (Kato 1.8).
- Verify on q-expansions (1.9) that the pullback of g_{a/N,b/N} is q^w times the two displayed infinite products, and hence is not a root of unity for (a,b) not (0,0). Kato PRINTS the exponent as w = 1/12 - a/2N + (1/2)(a/N^2) (checked on a rendering of p. 124, not merely in the text layer). Read literally that is a/N^2; the Bernoulli-consistent reading is (1/2)(a/N)^2 = a^2/(2N^2), which is what makes w = B_2(a/N)/2. This packet records the printed form and flags the ambiguity rather than silently choosing; a consumer that needs the exponent must resolve it against [KL] (Kubert-Lang) or against a clean edition.
- Verify that the descent to the algebraic curve is the pullback of c-theta_E and not an analytically defined function: the algebraic definition comes first, and 1.9 identifies the analytic pullback.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `siegelUnit` | data | The Siegel unit g_{a,b} on the modular curve Y(N), for a pair (a,b) of residues modulo N, not both zero. |
| `siegelUnit_isUnit` | structure | It is a unit of the coordinate ring of Y(N). |
| `siegelUnit_rationalise` | data | The c-independent rationalisation, obtained by inverting c squared minus one. |
| `siegelUnit_divisor_at_cusps` | characterisation | Its divisor at the cusps, which is what pins the normalisation. |
| `siegelUnit_field_of_definition` | compatibility | It is defined over the N-th cyclotomic field; the descent of suitable powers to the rationals is recorded as remaining in the coverage. |

**Uses.**

- `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`: the equivariance and the distribution relation are statements about these units
- `KatoEulerSystems:L1/beilinson-element-in-K2-of-Y-M-N`: the Beilinson element is the symbol of a pair of them

**Unit tests.** A plausible wrong definition fails one of these.

- `unit_away_from_cusps`: The Siegel unit is invertible on the open modular curve and has a nonzero divisor at the cusps.
- `distribution`: The product over the fibres of a degeneracy map reproduces the Siegel unit at lower level, which is the distribution relation.
- `c_independence`: The rationalisation does not depend on the auxiliary c; an implementation that keeps c in the output has not rationalised.

**Prerequisites.**

- `mathlib:Units`
- `mathlib:Matrix.GeneralLinearGroup`
- `mathlib:IsCyclotomicExtension`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 1.4, printed p. 122.

  > In 1.3, consider the case where E is the universal elliptic curve over Y (N), N > 3. We define c9a,ss- Take N > 1 such that Na = Nss = 0 ... Here i_* R(C0E) is defined since the image of ae1 + fre2 does not intersect with the divisor CE by the assumptions that c is prime to the orders of a, ss and (a,ss) is not (0,0).

  Gives the definition of the Siegel unit as the pullback of c-theta_E along a*e_1 + b*e_2 and the exact reason the pullback is defined, as recorded in the hypotheses and the first proofStep.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 1.4, printed p. 122.

  > By taking c such that (c, 6) = 1, c = 1 mod N and let 9a,ss = cya,ss (c2 - I )^{-1} in O(Y(N))^x tensor Q. Then it is seen from 1.3 (2) that #a # is independent of the choice of such c

  Confirms the rationalisation, the exact congruence condition c = 1 mod N, and that independence is deduced from Prop. 1.3(2).

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 1.1, printed p. 121.

  > Y(N) is a smooth irreducible affme curve. The total constant field of Y(N) (the field of all algebraic numbers in the affine ring 0(Y(N)) is not Q, but is generated over O bv a primitive N-th root of 1.

  Supports the hypothesis that the base is a smooth affine curve over Q whose constant field is Q(zeta_N); this matters for the Hochschild-Serre step used later in Sec. 8.4.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 1.9, printed p. 124 (read from a page rendering).

  > From 1.3 (3), we can deduce that the pull back of g_{a/N,b/N} on H for a, b in Z, 0 <= a < N, (a mod N, b mod N) not= (0,0) is equal to q^w . prod_{n >= 0}(1 - q^n q^{a/N} zeta_N^b) . prod_{n > 0}(1 - q^n q^{-a/N} zeta_N^{-b}) where w = 1/12 - a/2N + (1/2)(a/N^2). Here q^alpha for alpha in Q means e^{2 pi i alpha tau}.

  Gives the q-expansion and the exponent exactly as printed, including the ambiguous (1/2)(a/N^2); added in review, where the page was rendered because the text layer is unreadable at this display.

#### `siegel-unit-galois-action-and-distribution` — GL_2(Z/N)-equivariance and the distribution relation for Siegel units

*lemma.*

**Statement.** (1) For sigma in GL_2(Z/N) acting on Y(N) on the left by (E,e_1,e_2) -> (E, a*e_1 + c*e_2, b*e_1 + d*e_2), one has sigma^*(c-g_{alpha,beta}) = c-g_{alpha',beta'} and sigma^*(g_{alpha,beta}) = g_{alpha',beta'}, where (alpha',beta') = (alpha,beta)*sigma. The induced action on the total constant field sends a primitive N-th root of 1 to its det(sigma)-th power. (2) (Distribution property.) For (alpha,beta) in (Q/Z)^2 \ {(0,0)} and a nonzero integer a, c-g_{alpha,beta} = product over (alpha',beta') of c-g_{alpha',beta'}, the product being over all alpha' with a*alpha' = alpha and all beta' with a*beta' = beta, where c is any integer prime to a and to the orders of alpha and beta; the same holds for g after tensoring with Q.

**Hypotheses.**

- sigma acts on the left on Y(N) through its moduli description; the resulting action on the constant field Q(zeta_N) is by det, so equivariance statements must track the twisted Galois action on the constant field
- in (2) the auxiliary c must be prime to a as well as to 6 and to the orders of alpha and beta; this is stronger than the condition needed to define c-g_{alpha,beta} alone
- the product in (2) has a^2 factors (a choices of alpha' and a of beta') and is an identity in the direct limit over N of O(Y(N))^x

**Construction, or proof, in steps.**

1. (1) is the pullback of the definition of c-g along the moduli action; Kato records it as proved easily.
2. (2) is deduced from the norm-invariance N_a(c-theta_E) = c-theta_E of Prop. 1.3(1)(ii): the fibre of multiplication by a over the section iota_{alpha,beta} is exactly the set of sections iota_{alpha',beta'} with a*alpha' = alpha, a*beta' = beta, so the norm computes the product.
3. The rationalised form follows by raising to the power 1/(c^2-1) inside O(Y(N))^x tensor Q.

**Acceptance.**

- Check the determinant twist on constants: sigma^*(zeta_N) = zeta_N^{det(sigma)} is needed for the later identification of Galois descent data on Y(M,N).
- Check that (2) degenerates correctly when a is prime to N, in which case the product has a^2 terms indexed by the a-torsion translates.
- Check that (2) is a distribution relation for the pair (alpha,beta) jointly and not separately in each coordinate.

**Prerequisites.**

- `mathlib:Matrix.GeneralLinearGroup`
- `mathlib:ZMod.unitsMap`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, Lemma 1.7(1)(2), printed p. 123.

  > (2) (Distribution property.) Let (a,ss) in (Q/Z)\{(0,0)}, and let a be a non-zero integer. Then c9a,ss = prod c9ot'd' in U 0(Y(N))x ... where c is any integer which is prime to a and to the orders of a,ss, and a' (resp. ss') ranges over all elements of Q/Z such that aa' = a (resp. ass' = ss).

  Gives the exact index set of the distribution product and the exact coprimality hypothesis on c, both recorded in the statement and hypotheses.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, after Lemma 1.7, printed p. 123.

  > 1.7 (1) is proved easily. 1.7 (2) is deduced from Na(ceE) = c0E.

  States the proof route: (2) comes from the norm-invariance property (ii) of c-theta_E, as recorded in the second proofStep.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 1.6, printed p. 123.

  > The induced action by a on the total constant field sends a primitive N-th root a of 1 to adet^)

  Confirms the determinant twist on the constant field recorded in the statement.

#### `siegel-unit-degeneracy-product-formula` — Degeneracy-map product formula for Siegel units (Kato Lemma 2.12)

*lemma.*

**Statement.** Let (alpha,beta) in (Q/Z)^2 \ {(0,0)}, let A >= 1 and let c be prime to 6A and to the orders of alpha and beta. Then phi_A^*(c-g_{alpha,beta}) = product over beta' with A*beta' = beta of c-g_{alpha,beta'}; equivalently, as functions on the upper half plane, c-g_{alpha,beta}(A*tau) = product over those beta' of c-g_{alpha,beta'}(tau). This is the one-sided (second-coordinate only) degeneracy relation, distinct from the two-sided distribution relation of Lemma 1.7(2).

**Hypotheses.**

- A >= 1 arbitrary (not necessarily prime, and not necessarily prime to the level)
- c prime to 6A and to the orders of alpha and beta; the extra divisibility condition (c,A)=1 is what makes both sides defined
- phi_A is the degeneracy map induced by tau -> A*tau on the analytic model; the identity is asserted as an identity of functions on the upper half plane

**Construction, or proof, in steps.**

1. Kato proves the lemma from the analytic presentation of Prop. 1.3(3): substituting q -> q^A in the q-product for c-theta and regrouping the factors gives the product over the A-division points of beta in the second coordinate only.
2. The first coordinate alpha is unchanged because the degeneracy map multiplies only the lattice parameter tau, not the point alpha*tau + beta in its first coordinate.

**Acceptance.**

- Check that the product has exactly A factors, in contrast with the a^2 factors of Lemma 1.7(2).
- Check the identity on leading q-exponents: the exponent i_0 of 1.9 must add up correctly over the A choices of beta'.
- Check that the lemma really is used for both the ell-divides-N and ell-does-not-divide-N branches of Prop. 2.4 (Kato's 2.13, Steps 1 and 2).

**Prerequisites.**

- `mathlib:Matrix.GeneralLinearGroup`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, Lemma 2.12, printed p. 131.

  > Let faOEss) in (Q/Z)2 \ {(0,0)}. Let A >= 1, and let c be an integer which is prime to 6A and to the orders of alpha, beta. Then we have phi*_A (c9a,ss) = prod_{ss'} c9a,ss' (i.e. cga,ss (Atau) = prod c9a,ss'(tau) as functions on the upper half plane), where ss' ranges over all elements of Q/Z such that Ass' = ss.

  Gives the exact hypotheses (c prime to 6A and to the orders) and the exact one-sided index set, as recorded in the statement.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, after Lemma 2.12, printed p. 131.

  > This is proved by using the analytic presentation 1.3 (3) of Siegel units.

  Records that the proof route is the q-product of Prop. 1.3(3), as in the first proofStep.

---

## L1 Symbols and regulators

**Coverage: partial.** Kato Section 2 and Section 8 through Lemma 8.8: the Beilinson element in K_2 of Y(M, N), the projection formula and the level-change norm relation, the auxiliary-prime norm relation with the dual Hecke Euler factor, the etale Chern-character moment map and its Hecke and diamond equivariance. The audit records the layer as not built.

**Remaining in this layer:**

- Kato 2.9 (definition of T(n) and T'(n) and their double-coset formulas) and 2.10 (the definition of the Beilinson regulator on K_2 of a smooth complex curve) were skimmed only for the definitions; their proofs were not read.
- Step 4 of Kato 2.13, which proves the pushforward identities (2.13.1) and (2.13.2) and is where the dual Hecke operator T'(ell) actually appears, was not read; only Steps 1-3 and the statements of (2.13.1),(2.13.2) were inspected.
- The stage text asks for imports from K2SymbolsBrauer, SchemeKTheoryOperations, MotivicEtaleKTheory and PadicHodgeRegulators. Only the K_2 projection formula (Kato 2.11) and the etale Chern character on symbols (Kato 8.4) were read; the corresponding supplier statements in those roadmaps were not inspected in this packet, so no prerequisite edge to them is proposed here.
- Denominator/integrality formulas for the moment map (the 'denominator' item in the stage text) were not located in Kato Sec. 8; the integrality statements read are those of Thm. 12.6, which live at L2.

Two Siegel units make a symbol, and the symbol is the Beilinson element in `K_2(Y(M,N))`. Its
two norm relations are what make the family an Euler system: one in the level direction, proved by the
projection formula, and one at an auxiliary prime, where the **dual** Hecke operator appears in the Euler
factor. The distinction is not cosmetic; the source's Prop. 2.4 uses `T'(l)` and not `T(l)`.

The layer ends by leaving `K`-theory: the étale Chern-character moment map `Ch_{M,N}(k,r,r')` sends the
Beilinson element into the first cohomology of the modular local system, and its Hecke and diamond equivariance
is what lets both norm relations survive the passage.

**Planets of this layer** (4): *Beilinson zeta element in K_2*, *Level-change norm relation*, *Euler-factor norm relation*, *The moment map Ch(k,r,r prime)*.

### Nodes (5)

#### `beilinson-element-in-K2-of-Y-M-N` — The Beilinson zeta element in K_2(Y(M,N))

*construction.* **Planet:** *Beilinson zeta element in K_2*.

**Statement.** For M, N >= 2 with M + N >= 5, let Y(M,N) be the quotient of Y(L), for any L >= 3 with M | L and N | L, by the subgroup G of GL_2(Z/L) of matrices (a b; c d) with a = 1 mod M, b = 0 mod M, c = 0 mod N and d = 1 mod N (the definition is independent of L, Y(N,N) = Y(N) for N >= 3, and X(M,N) denotes the smooth compactification); for M + N >= 5 it represents triples (E,e_1,e_2) with M*e_1 = N*e_2 = 0 and Z/M x Z/N -> E, (a,b) -> a*e_1 + b*e_2, injective. For integers c, d with (c,6M) = 1 and (d,6N) = 1, the Beilinson (zeta) element is the Steinberg symbol c,d-z_{M,N} = {c-g_{1/M,0}, d-g_{0,1/N}} in K_2(Y(M,N)). Its rationalised form is z_{M,N} = {g_{1/M,0}, g_{0,1/N}} in K_2(Y(M,N)) tensor Q, and c,d-z_{M,N} = (c^2 - <c,1>^*)(d^2 - <1,d>^*) z_{M,N} in K_2(Y(M,N)) tensor Q, where <a,b>^* is the pullback by the diamond action (E,e_1,e_2) -> (E,a*e_1,b*e_2).

**Hypotheses.**

- M, N >= 2 and M + N >= 5 (assumed throughout Sec. 2 except in 2.8); the moduli interpretation fails below this bound
- (c,6M) = 1 and (d,6N) = 1: two separate auxiliary integers, one for each factor of the symbol, with coprimality to the respective level
- c-g_{1/M,0} lies in O(Y(M,1))^x and d-g_{0,1/N} in O(Y(1,N))^x by Lemma 1.7(1); the symbol is formed after pulling both back to Y(M,N)
- the rationalised z_{M,N} lies only in K_2 tensor Q, because both Siegel units were rationalised

**Construction, or proof, in steps.**

1. Pull back c-g_{1/M,0} from Y(M,1) and d-g_{0,1/N} from Y(1,N) to Y(M,N); Lemma 1.7(1) is what identifies the level at which each unit is already defined.
2. Form the Steinberg symbol of the two units in K_2 of the affine curve Y(M,N).
3. The comparison with the rationalised element follows from the c-dependence relation of 1.4 applied in each slot separately, producing the two commuting Euler-type operators (c^2 - <c,1>^*) and (d^2 - <1,d>^*).

**Acceptance.**

- Check that the element is genuinely a symbol of two units on the same affine curve, so that no localisation or relative K-theory is needed at this stage.
- Check that the two auxiliary smoothing operators commute and that each is invertible after inverting a single explicitly named integer, so that the passage between c,d-z and z is a controlled denominator and not an unrecorded rationalisation.
- Check the M + N >= 5 boundary: for (M,N) = (1,N) or (M,1) the moduli description of 2.1 is not asserted, and Kato treats those levels through 2.8 only.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `beilinsonElement` | data | The class in K_2 of Y(M,N) given by the symbol of two Siegel units. |
| `beilinsonElement_symbol` | characterisation | It is the Steinberg symbol of the two units, so its properties follow from theirs. |
| `beilinsonElement_norm_level` | compatibility | Its behaviour under the norm map along a change of level. |
| `beilinsonElement_norm_euler` | compatibility | Its behaviour under the norm at an auxiliary prime, where the dual Hecke Euler factor appears. |
| `beilinsonElement_regulator` | relation | Its image under the Beilinson regulator, which is the archimedean side of the zeta value formula. |

**Uses.**

- `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`: the moment map is applied to this element
- `KatoEulerSystems:L3/beilinson-regulator-and-the-archimedean-zeta-value`: the regulator formula is about this element

**Unit tests.** A plausible wrong definition fails one of these.

- `symbol_of_two_units`: The element is the symbol of two Siegel units, so it is killed by any relation that kills one of them.
- `level_norm`: The norm along a level change sends it to the corresponding element at the lower level, with the factor the source records.
- `euler_factor_appears`: At an auxiliary prime the norm introduces the dual Hecke operator and not the Hecke operator; the two differ and the source's Prop. 2.4 uses the dual one.

**Prerequisites.**

- `mathlib:AlgebraicGeometry.Scheme`
- `mathlib:Units`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.2, printed p. 126.

  > For integers c, d such that (c, 6M) = 1 and (d,6N) = 1, we define elements c,dZM,N, which we call "zeta elements" by c,dZM,N = {c g1/M,0, d g0,1/N} in K2(Y(M,N)). Note c g1/M,0 in O(Y(M,1))x and dyo,l/N in O(Y(1,N))x by 1.7 (1).

  Gives the definition of the Beilinson element as a Steinberg symbol, the exact coprimality hypotheses on c and d, and the observation (via Lemma 1.7(1)) that each factor is already defined at a smaller level.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.1, printed pp. 125-126.

  > If M + N > 5, the Q-scheme Y(M,N) represents the functor ... where E is an elliptic curve over S and e1 and e2 are sections of E over S such that Me1 = Ne2 = 0 and Z/M x Z/N -> E; (a,b) -> ae1 + be2 is injective.

  Fixes the moduli interpretation and the exact M + N >= 5 hypothesis recorded in the statement and hypotheses.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.1, printed p. 126.

  > In the rest of this section, except in 2.8, we always assume M , N >= 2, M + N >= 5.

  Confirms that the standing hypotheses of Sec. 2 are M,N >= 2 and M+N >= 5.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.1, printed p. 125 (read from a page rendering).

  > G = {(a b ; c d) in GL2(Z/L) ; a = 1 mod M, b = 0 mod M, c = 0 mod N, d = 1 mod N}. Then Y(M,N) is independent of the choice of L. We have Y(N,N) = Y(N) if N >= 3. Let X(M,N) be the smooth compactification of Y(M,N).

  Gives the explicit congruence subgroup defining Y(M,N), which the node had paraphrased loosely; added in review.

#### `K2-norm-projection-formula-and-level-norm-relation` — Projection formula for K_2-norms and the level-change norm relation

*theorem.* **Planet:** *Level-change norm relation*.

**Statement.** Let M | M', N | N' with M', N' >= 2, and assume prime(M) = prime(M') and prime(N) = prime(N'). Then the norm homomorphism K_2(Y(M',N')) -> K_2(Y(M,N)) sends c,d-z_{M',N'} to c,d-z_{M,N} for all c, d with (c,6M) = 1 and (d,6N) = 1 -- the coprimality is imposed at the LOWER level as printed, which under prime(M) = prime(M') and prime(N) = prime(N') is the same condition as at the higher level; after tensoring with Q it sends z_{M',N'} to z_{M,N}. The proof rests on the projection formula for the K_2-norm along a finite locally free morphism f: U -> V, namely f_*({u, f^*v}) = {f_*u, v} for u in O(U)^x and v in O(V)^x.

**Hypotheses.**

- prime(M) = prime(M') and prime(N) = prime(N') -- equality of the sets of prime divisors, not merely divisibility; this is used to choose coset representatives of the shape (1 + M*u, M*v; 0, 1)
- M', N' >= 2; the coprimality hypotheses are printed as (c,6M) = 1 and (d,6N) = 1, at the lower level, and are equivalent to the same conditions at M', N' precisely because the prime sets agree
- the norm is the K_2 transfer along the finite locally free covering Y(M',N') -> Y(M,N)

**Construction, or proof, in steps.**

1. By the projection formula for the K_2-norm, the general case reduces to the two separate cases M' = M and N' = N, which are symmetric; Kato treats N = N'.
2. For N = N', the task becomes the O^x-norm computation: show that N: O(Y(M',N))^x -> O(Y(M,N))^x sends c-g_{1/M',0} to c-g_{1/M,0}.
3. Choose L >= 3 with M' | L and N | L, set a = M'/M, and pick for each (x,y) in (Z/a)^2 an element s_{x,y} of GL_2(Z/L) of the shape (1 + M*u, M*v; 0, 1) with u = x and v = y mod a. Kato notes that this is possible exactly because prime(M') = prime(M).
4. These s_{x,y} form a system of representatives for H \ G, where G and H are the subgroups of GL_2(Z/L) cutting out Y(M,N) and Y(M',N). Hence the norm is the product of the s_{x,y}^*-translates.
5. Lemma 1.7(1) identifies each translate as c-g_{(1/M') + (x/a), y/a}, and Lemma 1.7(2) (distribution for the integer a) collapses the product to c-g_{1/M,0}.

**Acceptance.**

- Check that dropping prime(M) = prime(M') to mere divisibility breaks the argument at the coset-representative step, so the hypothesis is not cosmetic.
- Check that the projection formula is applied with one unit pulled back from the base -- i.e. that the reduction to the two one-sided cases is legitimate.
- Check compatibility of the two reductions (M' = M then N' = N) with the diamond operators, so that no residual <a,b>^* appears.

**Prerequisites.**

- `KatoEulerSystems:L0/siegel-unit-galois-action-and-distribution`
- `mathlib:AlgebraicGeometry.Scheme`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, Prop. 2.3, printed p. 126.

  > Let M', N' > 2, and assume M | M', N | N'. Assume further that prime(M) = prime(M'), prime(N) = prime(N'), where for an integer a >= 1, prime(a) denotes the set of all prime divisors of a. Then, the norm homomorphism K2(Y(M',N')) -> K2(Y(M,N)) sends c,dZM',N' to c,dZM,N

  Gives the exact hypothesis prime(M) = prime(M') and the exact conclusion, as recorded in the statement.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.11, printed p. 131.

  > In general, if f : U -> V is a morphism of schemes which is finite and locally free, and if u in O(U)x and v in O(V)x, the norm map f* : K2(U) -> K2(V) satisfies the projection formula ... Hence, it is enough to prove the case M' = M and the case N' = N.

  Confirms the projection formula and the reduction to the two one-sided cases, as in the first proofStep.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.11, printed p. 131.

  > For each (x,y) in (Z/a)2, fix an element Sx,y of GL2(Z/L) of the form (1+Mu 0 Mv1) such that u = x mod a and v = y mod a. (This is possible because prime(M') = prime(M).) Then sx,y for (x,y) in (Z/a)2 form a system of representatives of H\G.

  This is the exact point at which the hypothesis prime(M') = prime(M) is used, as recorded in the third proofStep.

#### `euler-factor-norm-relation-at-auxiliary-primes` — Auxiliary-prime norm relation with the dual-Hecke Euler factor

*theorem.* **Planet:** *Euler-factor norm relation*.

**Statement.** Let ell be a prime not dividing M, and let c, d be integers with (c,6*M*ell) = 1 and (d,6*N*ell) = 1. Then the norm homomorphism K_2(Y(M*ell,N*ell)) -> K_2(Y(M,N)) sends c,d-z_{M*ell,N*ell} to the value on c,d-z_{M,N} of the ell-Euler factor of the operator-valued zeta function Z_{M,N}(s) of 2.5: the three-term operator (1 - T'(ell)<1/ell,1>^* + <1/ell,1/ell>^* . ell) when ell does not divide N, and the two-term operator (1 - T'(ell)<1/ell,1>^*) when ell divides N. The factor multiplying the quadratic term is exactly ell (read from a rendering of printed p. 126, the text layer having dropped it); it is the value at s = 0 of the term ell^{1-2s} in the Euler factor of Z_{M,N}(s) recorded in 2.5. The same holds for z_{M,N} after tensoring with Q. Here T'(ell) is the dual Hecke operator of 2.9 and <a,b>^* the diamond pullback.

**Hypotheses.**

- ell is a prime not dividing M; ell is allowed to divide N, and the two cases give genuinely different Euler factors (three-term versus two-term)
- (c, 6*M*ell) = 1 and (d, 6*N*ell) = 1: the auxiliary integers must be coprime to ell as well
- the operator is written in terms of the dual Hecke operator T'(ell) and the diamond pullbacks, acting on K_2 of the lower-level curve; this is the Tate-dual normalisation, not the naive Hecke normalisation

**Construction, or proof, in steps.**

1. Factor the covering Y(M*ell,N*ell) -> Y(M,N) into Y(M*ell,N*ell) -> Y(M,N*ell) -> Y(M,N(ell)) -> Y(M,N), and let G_0 in G_1 in G_2 in G_3 be the corresponding subgroups of GL_2(Z/(L*ell)).
2. Step 1: for G_0 \ G_1, choose representatives s_{x,y} = (u, v; 0, 1) with u = 1, v = 0 mod M and u = M*x, v = M*y mod ell, indexed by (x,y) in (Z/ell)^x x Z/ell. The norm of c-g_{1/(M*ell),0} is the product of the translates, which by Lemma 1.7(2) and Lemma 2.12 equals c-g_{1/M,0} times phi_ell^*(c-g_{alpha,0})^{-1}, where alpha is the unique element of (1/M)Z/Z with ell*alpha = 1/M.
3. Step 2: for G_1 \ G_2, choose representatives s_x = (u, ?; ?, ?) with u = 1 + N*x mod N*ell (when ell | N), resp. u = 1 mod N and u = N*x mod ell (when ell does not divide N), indexed by x in Z/ell resp. (Z/ell)^x. Lemma 2.12 again collapses the product of translates of d-g_{0,1/(N*ell)}.
4. Step 3: the remaining map K_2(Y(M,N(ell))) -> K_2(Y(M,N)) is handled by the two pushforward identities (2.13.1) and (2.13.2), whose proofs Kato gives in Step 4; these produce exactly the dual Hecke operator T'(ell) and the diamond terms.
5. Assembling the three steps gives the stated Euler-factor operator, matching the ell-factor of Z_{M,N}(s) recorded in 2.5.

**Acceptance.**

- Check that the ell-divides-N branch really loses the quadratic term, and that the resulting two-term factor is the one appearing in Z_{M,N}(s) for ell | N.
- Check the power of ell in the quadratic term: it is ell^1 here, ell^{1-2s} in Z_{M,N}(s) at 2.5, and p^{k-1-2r} in the p-adic analogue of Thm. 9.5 and Prop. 8.7(2). The three are consistent only after the moment map's twist (Lemma 8.8) is applied, which is the content of the link from the equivariance node.
- Check that T'(ell) is the dual Hecke operator of 2.9 and not T(ell): the norm relation is stated with the dual operator throughout, and the Euler system convention in Chapter III depends on this choice.
- Verify the three-step factorisation is a factorisation of the covering map and not of the moduli functor only.

**Prerequisites.**

- `KatoEulerSystems:L0/siegel-unit-degeneracy-product-formula`
- `mathlib:MvPolynomial`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, Prop. 2.4, printed p. 126 (transcribed from a page rendering).

  > Let ell be a prime number which does not divide M. Let c, d be integers such that (c, 6M ell) = 1 and (d, 6N ell) = 1. Then the norm homomorphism K2(Y(M ell, N ell)) -> K2(Y(M,N)) sends c,d z_{M ell, N ell} to (1 - T'(ell)( 1/ell 0 ; 0 1 )^* + ( 1/ell 0 ; 0 1/ell )^* . ell) . c,d z_{M,N} in the case ell does not divide N, and to (1 - T'(ell)( 1/ell 0 ; 0 1 )^*) . c,d z_{M,N} in the case ...

  Gives the two branches with their exact operators, including the factor ell in the quadratic term that the text layer drops, and the exact coprimality hypotheses. Transcribed in review from a rendering of p. 126. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.5, printed p. 127.

  > This function ZM,N(S) has a presentation as an Euler product whose Euler factor at a prime number ell is 1 - T'(ell) ( 1/ell 0 ; 0 1 )* ell^{-s} + ( 1/ell 0 ; 0 1/ell )* ell^{1-2s} if (ell,MN) = 1, 1 - T'(ell) ( 1/ell 0 ; 0 1 )* ell^{-s} if (ell, M) = 1 and ell | N, 1 if ell | M.

  Gives the three-case Euler factor of the operator-valued zeta function; the node identifies the norm relation of 2.4 with this Euler factor, and the three cases match 2.4's two branches plus the trivial case ell | M.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.13, printed pp. 131-132.

  > The morphism Y(M ell, N ell) -> Y(M, N) factors as Y(M ell, N ell) -> Y(M, N ell) -> Y(M,N(ell)) -> Y(M,N). Let G0, G1, G2, G3 be the subgroups of GL2(Z/L ell) corresponding to Y(M ell, N ell), Y(M, N ell), Y(M,N(ell)), Y(M,N), respectively. (So, G0 in G1 in G2 in G3.)

  Confirms the three-step factorisation recorded in the proofSteps.

#### `etale-chern-moment-map-into-modular-local-system` — The etale Chern-character moment map Ch_{M,N}(k,r,r')

*construction.* **Planet:** *The moment map Ch(k,r,r prime)*.

**Statement.** Fix k >= 2 and integers r, r' with 1 <= r' <= k-1. Let H_p = R^1 lambda_*(Z_p) on Y(M,N)_et for the universal curve lambda, and let V_{k,Z_p}(Y(M,N)) = H^1(Y(M,N) tensor Qbar, Sym^{k-2}(H_p)), a Z_p-sheaf cohomology carrying a Gal(Qbar/Q)-action unramified outside p*M*N. There is a canonical homomorphism Ch_{M,N}(k,r,r') : lim_n K_2(Y(M*p^n, N*p^n)) -> H^1(Z[1/p], V_{k,Z_p}(Y(M,N))(k-r)), the inverse limit being along the norm maps, built as the composite of: (i) the etale Chern character K_2(X) -> H^2(X,(Z/p^n)(2)), which on symbols is {f,g} -> h(f) cup h(g) for h the Kummer connecting map; (ii) multiplication by e_{1,n}^{(r'-1)} tensor e_{2,n}^{(k-r'-1)} tensor (zeta_{p^n})^{(-r)} for the basis (e_{1,n},e_{2,n}) of T_pE/p^n over Y(M*p^n,N*p^n); (iii) the isomorphism Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(2-k) induced by the Poincare duality isomorphism T_pE = H_p(1); (iv) the trace map down to Y(M,N); (v) the edge map of the Hochschild-Serre spectral sequence E_2^{a,b} = H^a(Q, H^b(Y(M,N) tensor Qbar, -)).

**Hypotheses.**

- p is invertible on the schemes involved; the Chern character is taken with (Z/p^n)(2)-coefficients and only afterwards passed to the limit
- 1 <= r' <= k-1 is required for the moment exponents r'-1 and k-r'-1 to be non-negative
- the identification T_pE = H_p(1) is Poincare duality for the universal curve, which is where the Tate twist (2-k) in step (iii) originates: the twists are dictated by the source degree of the regulator and are not free choices
- the vanishing H^b(Y(M,N) tensor Qbar, -) = 0 for b >= 2 needed for the Hochschild-Serre edge map holds because Y(M,N) tensor Qbar is an affine curve over an algebraically closed field
- the landing in H^1(Z[1/p],-) rather than H^1(Q,-) requires the separate integrality input recorded in the sibling node

**Construction, or proof, in steps.**

1. Apply the etale Chern character to the symbol c,d-z at level M*p^n, N*p^n, obtaining a class in H^2 with (Z/p^n)(2)-coefficients.
2. Multiply by the chosen moment monomial in the p^n-torsion basis and the p^n-th root of unity; this is the geometric moment map that converts a K_2 symbol into a Sym^{k-2}-valued class and simultaneously fixes the Tate twist.
3. Transport along Sym^{k-2}(T_pE) = Sym^{k-2}(H_p)(2-k) and push down by the trace along Y(M*p^n,N*p^n) -> Y(M,N).
4. Take the Hochschild-Serre edge map, legitimate because the geometric cohomology vanishes in degrees >= 2 for an affine curve; this converts an H^2 of the scheme into an H^1 of the Galois group with coefficients in the geometric H^1.

**Acceptance.**

- Check that steps (ii) and (iii) together produce exactly the twist (k-r) recorded in the target, and not (k-r') or (2-r).
- Check the naturality of Ch_{M,N} in n, so that the inverse limit over the K_2 norm maps is compatible with the trace maps on cohomology.
- Check the claimed affineness input: the vanishing of H^b for b >= 2 is the only reason the edge map is defined, so a compactified curve would need a different argument.
- Compare with Soule's cyclotomic construction, which Kato names as the model: the modular-curve case must reproduce Soule's twisting when k = 2 and the Siegel units are replaced by cyclotomic units.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `chernMoment` | data | The etale Chern-character moment map attached to a weight k and two twists r and r prime. |
| `chernMoment_hecke` | compatibility | Its Hecke equivariance. |
| `chernMoment_diamond` | compatibility | Its equivariance for the diamond operators. |
| `chernMoment_target` | projection | Its target, the first cohomology of the modular local system with the stated twist. |
| `chernMoment_of_symbol` | relation | Its value on a symbol, which is where the Chern character on K_2 enters. |

**Uses.**

- `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`: the zeta elements are the images of the Beilinson elements under this map
- `KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map`: the equivariance is the statement that makes the norm relations survive the map

**Unit tests.** A plausible wrong definition fails one of these.

- `weight_two_case`: For k equal to two the moment map is the etale Chern character followed by the identity on the local system, which is the case a reader should check first.
- `equivariance`: The map commutes with the Hecke and diamond operators; without that the norm relations do not transport.
- `twists_are_two`: The map depends on two twists r and r prime separately; a version with one twist is not the source's map.

**Prerequisites.**

- `mathlib:groupCohomology`
- `mathlib:PadicInt`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, 8.4, printed pp. 182-183.

  > Define ChM,N(k,r,r) to be the composite map lim K2(Y(Mp^n,Np^n)) -> lim H2(Y(Mp^n,Np^n),(Z/p^n)(2)) -> ... where: The first arrow is the Chern character map. (For a scheme X on which p is invertible and for f, g in O(X)x, the Chern character map K2(X) -> H2(X, (Z/p^n)(2)) sends {f,g} to h(f) cup h(g), where h is the connecting map of the Kummer sequence) ... The second arrow is the ...

  Gives the five-step construction, the explicit moment monomial, and the Kummer/cup-product description of the Chern character, as recorded in the statement and proofSteps. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, 8.4, printed p. 183.

  > The last arrow is defined by the spectral sequence E2^{a,b} = Ha(Q, Hb(Y(M, N) tensor Qbar, )) -> H^{a+b}(Y(M,N), ) and by the fact Hb(Y(M, N) tensor Qbar, ) = 0 for b >= 2. (The last fact is because Y(M, N) tensor Qbar is an affine curve over an algebraically closed field.)

  Confirms the Hochschild-Serre step and the exact reason for the degree vanishing, recorded as a hypothesis.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, 8.4, printed p. 182.

  > Poincare duality gives a canonical isomorphism (8.4.1) TpE = H_p(1) where (1) means the Tate twist, and this induces (8.4.2) Sym^{k-2}(TpE) = Sym^{k-2}(H_p)(2-k).

  Confirms the source of the twist (2-k) in step (iii), recorded in the hypotheses as a duality-dictated normalisation.

#### `hecke-and-diamond-equivariance-of-the-moment-map` — Hecke and diamond equivariance of Ch_{M,N}(k,r,r') (Kato Lemma 8.8)

*lemma.*

**Statement.** The homomorphism Ch_{M,N}(k,r,r') satisfies (1) T'(n) o Ch_{M,N}(k,r,r') = n^{r-1} * Ch_{M,N}(k,r,r') o T'(n) for every integer n prime to M*p, and (2) <a,b>^* o Ch_{M,N}(k,r,r') = a^{r'-1} * b^{k-r'-1} * (a*b)^{-r} * Ch_{M,N}(k,r,r') o <a,b>^* for all integers a, b with (a,M*p) = 1 and (b,N*p) = 1. These scalars are exactly the ones produced by the moment monomial and the Tate twist in the construction.

**Hypotheses.**

- n prime to M*p in (1); a prime to M*p and b prime to N*p in (2)
- the operators on the two sides are the dual Hecke and diamond operators acting on K_2 (source) and on the Galois cohomology of the modular local system (target); the lemma is an intertwining relation with explicit scalars, not a commutation

**Construction, or proof, in steps.**

1. The scalars arise from the transformation of the moment monomial e_1^{(r'-1)} tensor e_2^{(k-r'-1)} tensor zeta^{(-r)} under the diamond action on the p^n-torsion basis and under the twisting of the root of unity: e_1 -> a*e_1, e_2 -> b*e_2, zeta -> zeta^{a*b}.
2. Kato records the lemma as proved easily from the definition of Ch in 8.4.

**Acceptance.**

- Check the exponent bookkeeping: setting a = b = n in (2) should be consistent with (1) via the relation between T'(n) and the diamond operators.
- Check that the scalars vanish no information when r' = k-1 (the case used in the reciprocity theorems 9.5-9.7).
- Check that this lemma, together with Props. 2.3 and 2.4, is exactly what yields the p-adic norm relations of Prop. 8.7, so that no additional geometric input enters at that point.

**Prerequisites.**

- `mathlib:Matrix.GeneralLinearGroup`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, Lemma 8.8, printed p. 185.

  > (1) T'(n) o ChM,N(k, r, r') = n^{r-1} ChM,N(k,r,r') o T'(n) for any integer n which is prime to Mp (2) <a,b>* o ChM,N(k,r, r') = a^{r'-1} b^{k-r'-1} (ab)^{-r} ChM,N(k,r,r') o <a,b>* for any integers a, b such that (a, Mp) = 1 and (b, Np) = 1. This lemma is proved easily.

  Gives both intertwining relations with their exact scalars and coprimality hypotheses, and records that Kato treats the proof as immediate from the construction.

---

## L2 Global zeta classes

**Coverage: partial.** Kato Section 8 and Theorem 12.6: the Perrin-Riou and Rubin integrality lemma placing the cyclotomic limit in S-integral cohomology, the p-adic zeta elements with both norm relations, the Euler-system datum for the modular lattice, and the integral zeta submodule with its finite index. The audit records the layer as not built.

**Remaining in this layer:**

- Kato 8.9-8.12 (the constructions of the elements (8.1.2) and (8.1.3) and Props. 8.10, 8.12) were read only in outline; Prop. 8.12, which is the actual input to Example 13.3, was not read in full.
- Kato Sec. 4-6 (Euler systems in the spaces of modular forms, the elements on X_1(N) tensor Q(zeta_m), projections to eigen cusp forms, and Thm. 6.6) were not read; they supply the modular-form side of the zeta elements and the archimedean zeta-value formula.
- The stage text asks for 'moment compatibility in the weight'. Kato's weight-moment compatibility statements were not located in the sections read.
- The stage text asks for the rational universal class before projection and its compatibility with the Hecke algebra; Kato 8.3's construction of V_{O_lambda}(f) as the image of V_{k,Z_p}(Y_1(N)) was read, but the universal-class formulation and the Hecke-algebra compatibility were not.

The zeta elements live in an integral cohomology group, and getting them there is the content of
the Perrin-Riou and Rubin integrality lemma. Once there, they satisfy two norm relations - in the level
direction and along the cyclotomic tower - which is exactly the shape the generic Euler-system machine consumes.

The layer assembles the datum `(T, F_lambda, Sigma)` with its Euler polynomials, and records the integral zeta
submodule `Z` with its finite index in `Z(f,T)`. What it does **not** do is check that this datum satisfies the
hypothesis package of the machine: the integrated decomposition records that the source's Theorem 13.4 and
Rubin's Theorem II.3.3 do not package the hypotheses identically, and that hypothesis (v) is never verified for
non-CM forms in the sections read. Both are carried forward as gaps.

**Planets of this layer** (3): *p-adic zeta elements*, *The modular Euler-system datum*, *The integral zeta submodule*.

### Nodes (4)

#### `integrality-of-the-cyclotomic-limit-in-S-integral-cohomology` — Perrin-Riou/Rubin integrality lemma placing the limit in H^1(Z[1/p],-)

*lemma.*

**Statement.** Let K be a finite extension of Q with ring of integers O_K, and let T be a finite Z_p-module with a continuous Gal(Kbar/K)-action. Then (1) for any set S of finite places of K containing all places above p, the canonical map H^1(O_K[S^{-1}],T) -> H^1(K,T) is injective; and (2) the image of lim_n H^1(K(zeta_{p^n}),T) -> H^1(K,T) is contained in the image of H^1(O_K[1/p],T) -> H^1(K,T). Consequently the image of Ch_{M,N}(k,r,r') lies in the image of the canonical injection H^1(Z[1/p], V_{k,Z_p}(Y(M,N))(k-r)) -> H^1(Q, ...), so the p-adic zeta elements are S-integral classes.

**Hypotheses.**

- T finite over Z_p with continuous Galois action (the statement is applied to T/p^n and then passed to the limit)
- S contains all places over p; the conclusion of (2) is specifically about the cyclotomic tower K(zeta_{p^n})
- no ordinariness, crystallinity or good-reduction hypothesis is required

**Construction, or proof, in steps.**

1. The localisation exact sequence for the etale cohomology of O_K[S^{-1}] reduces both claims to a statement at each maximal ideal v not lying over p.
2. Locally, H^1(O_v,T) -> H^1(K_v,T) is injective because H^1(O_v,T) = H^1(Gal(K_v^{ur}/K_v), H^0(K_v^{ur},T)) (unramified cohomology).
3. The cokernel of H^1(O_v,T) -> H^1(K_v,T) is identified with H^1(Gal(K_v^{ur}/K_v), H^1(I_v,T)) and, by local duality, with a Hom into Q_p/Z_p of H^0 of the Tate dual over the residue field.
4. The composite lim_n H^1(K_v(zeta_{p^n}),T) -> H^1(K_v,T) -> cokernel factors through lim_n H^1(F_v(zeta_{p^n}), H^0(K_v^{ur}, T^*(1))), and this inverse limit vanishes because the p-cohomological dimension of the union of the F_v(zeta_{p^n}) is zero.
5. Kato then combines this with 8.6: the projection Y(M*p^n,N*p^n) -> Y(M,N) factors through Y(M,N) tensor Q(zeta_{p^n}), so the image of Ch is a limit over the cyclotomic tower and (2) applies.

**Acceptance.**

- Check that the argument uses only the residue-field cohomological dimension and therefore does not need p odd.
- Check that (1) is what allows the S-integral cohomology group to be treated as a subgroup rather than merely mapping to H^1(K,T).
- Check the factorisation in 8.6 of the p-power level projection through the constant-field extension by Q(zeta_{p^n}) -- this is what makes the tower cyclotomic.

**Prerequisites.**

- `mathlib:groupCohomology.H1`
- `mathlib:PadicInt`
- `mathlib:NumberField.RingOfIntegers`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, Lemma 8.5, printed p. 183.

  > (1) For any set S of finite places of K containing all places lying over p, the canonical map H1(OK[S^{-1}],T) -> H1(K, T ) is injective. (2) The image of lim_n H1(K(zeta_{p^n}), T ) -> H1(K, T ) is contained in the image of H1(OK[1/p],T) -> H1(K, T ).

  Gives both parts verbatim with their hypotheses; Kato attributes them to [PeO, 2.2.4] and [Ru4, B3.3].

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, proof of Lemma 8.5, printed p. 184.

  > Hence we are reduced to showing lim_n H1(F_v(zeta_{p^n}),H0(K_v^{ur},T^*(1))) = 0 and hence to the fact that the p-cohomological dimension of the field union_{n>=1} F_v(zeta_{p^n}) is zero.

  Confirms the final step of the proof recorded in the fourth proofStep, and shows the proof is unconditional in p.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, 8.6, printed p. 184.

  > The projections Y(Mp^n,Np^n) -> Y(M,N) factor canonically as Y(Mp^n,Np^n) -> Y(M,N) tensor Q(zeta_{p^n}) -> Y(M,N), and hence the image of ChM,N(k, r, r') is contained in the image of lim H1(Q(zeta_{p^n}), Vk,Z/p^m(Y(M,N))).

  Confirms that the relevant tower is the cyclotomic one, so that part (2) of the lemma applies.

#### `p-adic-zeta-elements-and-their-norm-relations` — The p-adic zeta elements c,d-z^{(p)}_{M,N}(k,r,r') and their two norm relations

*construction.* **Planet:** *p-adic zeta elements*.

**Statement.** For M, N >= 1 with M + N >= 5, k >= 2, 1 <= r' <= k-1, (c,6pM) = 1 and (d,6pN) = 1, define c,d-z^{(p)}_{M,N}(k,r,r') = Ch_{M,N}(k,r,r')((c,d-z_{M*p^n,N*p^n})_n) in H^1(Z[1/p], V_{k,Z_p}(Y(M,N))(k-r)), the inverse limit being formed by Prop. 2.3. These elements satisfy: (1) (level norm relation) if M | M', N | N', (c,M') = (d,N') = 1 and prime(M*p) = prime(M'*p), prime(N*p) = prime(N'*p), the norm map sends c,d-z^{(p)}_{M',N'}(k,r,r') to c,d-z^{(p)}_{M,N}(k,r,r'); (2) (Euler relation) for a prime ell prime to M*p*c*d, the norm map K_2-side relation of Prop. 2.4 transports to the three-term operator 1 - T'(ell)<1/ell,1>^* + <1/ell,1/ell>^* ell^{k-1-2r} when ell does not divide N, and the two-term operator 1 - T'(ell)<1/ell,1>^* when ell divides N.

**Hypotheses.**

- the constraints M+N >= 5, 1 <= r' <= k-1, (c,6pM) = 1, (d,6pN) = 1 are exactly the standing hypotheses of (8.1.1)
- in (1) the prime-set condition is imposed on M*p and M'*p (and on N*p, N'*p), i.e. after adjoining p, which is weaker than the condition prime(M) = prime(M') of Prop. 2.3 and is what allows the p-power tower to be built
- in (2) ell must be prime to M, p, c and d; ell may divide N
- the exponent k-1-2r in the quadratic term is the p-adic shadow of the archimedean Euler factor of 2.5 and is forced by the twist (k-r) and the equivariance scalars of Lemma 8.8

**Construction, or proof, in steps.**

1. Prop. 2.3 makes (c,d-z_{M*p^n,N*p^n})_n a compatible system for the K_2 norm maps: the hypothesis prime(M*p^n) = prime(M*p^{n+1}) holds automatically once n >= 1.
2. Apply Ch_{M,N}(k,r,r') to that system; the resulting class lies in H^1(Z[1/p],-) by Lemma 8.5 together with the factorisation 8.6.
3. Relation (1) is Prop. 2.3 transported by Ch, using Lemma 8.8 to see that no scalar is introduced.
4. Relation (2) is Prop. 2.4 transported by Ch: Lemma 8.8(1),(2) convert the operators T'(ell)<1/ell,1>^* and <1/ell,1/ell>^* into their twisted forms, producing the explicit power ell^{k-1-2r}.

**Acceptance.**

- Check that the exponent in the quadratic term of the p-adic Euler relation agrees with the exponent appearing in Thm. 9.5's third case (where it is printed as p^{k-1-2r}).
- Check that (1) really needs only prime(M*p) = prime(M'*p): this weakening relative to 2.3 is what makes the p-tower usable.
- Check that the elements are indexed by both r and r', and that only some pairs (r,r') are admissible for the reciprocity theorem (Thm. 9.5 requires one of r,r' to equal k-1).

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `zetaElement` | data | The p-adic zeta element attached to the data M, N, k, r, r prime and the auxiliary c, d. |
| `zetaElement_norm_level` | compatibility | The norm relation in the level direction. |
| `zetaElement_norm_p` | compatibility | The norm relation in the p-direction, along the cyclotomic tower. |
| `zetaElement_integral` | structure | Its integrality, which is what the Perrin-Riou and Rubin lemma supplies. |
| `zetaElement_of_beilinson` | relation | It is the image of the Beilinson element under the moment map. |

**Uses.**

- `KatoEulerSystems:L2/euler-system-datum-for-the-modular-lattice`: the datum is assembled from these elements and their norm relations
- `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`: the reciprocity law computes the dual exponential of these elements

**Unit tests.** A plausible wrong definition fails one of these.

- `two_norm_relations`: There are two norm relations, one in the level direction and one in the p-direction; an Euler system needs both.
- `integrality`: The element lies in the integral cohomology group, not only in its rationalisation; this is where the integrality lemma is used.
- `auxiliary_c_d`: The element depends on the auxiliary c and d, and the dependence is removed only after the Euler factors are inverted.

**Prerequisites.**

- `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`
- `KatoEulerSystems:L1/hecke-and-diamond-equivariance-of-the-moment-map`
- `KatoEulerSystems:L2/integrality-of-the-cyclotomic-limit-in-S-integral-cohomology`
- `mathlib:groupCohomology.H1`
- `mathlib:PadicInt`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, (8.1.1), printed p. 180.

  > c,dz^{(p)}_{M,N}(k,r,r') in H1(Z[1/p], Vk,Zp(Y(M,N))(k-r)) where M,N >= 1, M + N >= 5, and r, r', c, d are integers satisfying 1 <= r' <= k - 1, (c, 6pM) = 1, (d,6pN) = 1.

  Gives the target group, the twist (k-r), and the full list of numerical hypotheses recorded in the node.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, Prop. 8.7(1), printed p. 184.

  > Let M', N' >= 1 and assume M | M', N | N', (c,M') = (d,N') = 1, prime(Mp) = prime(M'p), prime(Np) = prime(N'p). Then the norm map ... sends c,d z^{(p)}_{M',N'} to c,d z^{(p)}_{M,N}

  Gives relation (1) with the prime-set condition stated after adjoining p, exactly as recorded in the hypotheses.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, Prop. 8.7(2), printed p. 184.

  > Let ell be a prime number which is prime to Mpcd. Then the norm map ... sends c,d z^{(p)}_{M ell,N ell}(k,r,r') to 1-T'(ell)( 1/ell 0 ; 0 1 )* + ( 1/ell 0 ; 0 1/ell )* ell^{k-1-2r} c,dz^{(p)}_{M,N}(k, r, r') in the case ell does not divide N, and to 1 - T'(ell)( 1/ell 0 ; 0 1 )* c,dz^{(p)}_{M,N}(k,r,r') in the case ell divides N.

  Gives relation (2), including the explicit exponent k-1-2r in the quadratic term.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, before Prop. 8.7, printed p. 184.

  > The following 8.7 is deduced from the norm properties 2.3, 2.4 of zeta elements in K2 by Lemma 8.8 below.

  States the proof route of Prop. 8.7 used in the third and fourth proofSteps.

#### `euler-system-datum-for-the-modular-lattice` — The modular Euler-system datum (T, F_lambda, Sigma) and its Euler polynomials

*construction.* **Planet:** *The modular Euler-system datum*.

**Statement.** Fix a normalised newform f of weight k and level N, a place lambda of F = Q(a_n : n >= 1) over p, an integer r, and set T = V_{O_lambda}(f)(k-r). Fix 1 <= j <= k-1, nonzero integers c, d and a symbol xi that is either a(A) (with (c,6pA) = 1, (d,6pN) = 1) or an element of SL_2(Z) (with (c*d,6pN) = 1). Put Sigma = prime(c*d*p*A*N) resp. prime(c*d*p*N), and S = {m >= 1 : prime(m) intersect Sigma = {p}}. For m in S, let z_m = c,d-z^{(p)}_m(f,r,j,xi,prime(m*A)) resp. c,d-z^{(p)}_m(f,r,j,xi,prime(m*N)) in H^1(Z[zeta_m,1/p],T). Then (z_m)_{m in S} is an Euler system for (T,F_lambda,Sigma) in the sense of 13.1: for m | m' in S the corestriction from Q(zeta_{m'}) to Q(zeta_m) sends z_{m'} to the product over primes ell dividing m' but not m of P_ell(ell^{-1} sigma_ell^{-1}) applied to z_m, where sigma_ell is the arithmetic Frobenius in Gal(Q(zeta_m)/Q) and P_ell is the Euler polynomial of the datum. NOTE A SOURCE-INTERNAL DISCREPANCY: 13.1 defines P_ell(t) = det_{O_L}(1 - Fr_ell^{-1} t : T), whereas Example 13.3 computes with P_ell(t) = det_{O_L}(1 - Fr_ell . t ; T); both were read from the printed page. For T = V_{O_lambda}(f)(k-r) the printed computation gives P_ell(t) = 1 - abar_ell ell^{1-r} t + epsbar(ell) ell^{k+1-2r} t^2 and P_ell(ell^{-1} sigma_ell^{-1}) = 1 - abar_ell ell^{-r} sigma_ell^{-1} + epsbar(ell) ell^{k-1-2r} sigma_ell^{-2}, the bars denoting the complex conjugates.

**Hypotheses.**

- for ell not dividing N*p, det(1 - Fr_ell^{-1} t : V_{F_lambda}(f)) = 1 - a_ell t + epsilon(ell) ell^{k-1} t^2, and P_ell for the twisted lattice T = V_{O_lambda}(f)(k-r) is the corresponding twisted polynomial
- the norm relation is a corestriction relation, and the Euler factor is evaluated at ell^{-1} sigma_ell^{-1} with sigma_ell the ARITHMETIC Frobenius -- this is the Tate-dual convention and must not be replaced by the geometric Frobenius
- the index set (Kato writes Xi, this node writes S) is {m >= 1 : prime(m) intersect Sigma = {p}}; since the intersection must EQUAL {p}, every m in it is divisible by p, and apart from p its prime divisors avoid Sigma. Kato makes this explicit in Example 13.2, where Sigma = {p} and he glosses 'for m in Xi (that is, for any m >= 1 such that p | m)'
- the datum depends on the auxiliary data (c,d,j,xi), which are fixed once and for all; different choices give different Euler systems

**Construction, or proof, in steps.**

1. Prop. 8.12 (the analogue of Prop. 8.7(2) at the level of the elements (8.1.3)) supplies the corestriction relation with the two-term/three-term operator.
2. Compare that operator with P_ell(ell^{-1} sigma_ell^{-1}). The printed computation (p. 225) starts from det_{O_L}(1 - Fr_ell^{-1} . t ; V_{F_lambda}(f)) = 1 - a_ell t + epsilon(ell) ell^{k-1} t^2, notes that this polynomial factors as (1 - alpha t)(1 - beta t) with |alpha| = |beta| = ell^{(k-1)/2}, and obtains for the twisted lattice P_ell(t) = 1 - abar_ell ell^{1-r} t + epsbar(ell) ell^{k+1-2r} t^2, hence P_ell(ell^{-1} sigma_ell^{-1}) = 1 - abar_ell ell^{-r} sigma_ell^{-1} + epsbar(ell) ell^{k-1-2r} sigma_ell^{-2}.
3. Conclude that (z_m)_m satisfies (13.1.1), i.e. is an Euler system for (T,F_lambda,Sigma).

**Acceptance.**

- Check that the arithmetic-Frobenius convention here matches the convention of the generic Euler-system theory that will consume the datum; a geometric-Frobenius convention changes P_ell(t) to its reciprocal-twisted form.
- Check the Euler factor at ell | N (where a_ell is not a full Hecke eigenvalue) and confirm which primes are placed in Sigma.
- Check that the assignment is a system on the whole of S and not merely on the p-power part: the auxiliary-prime relation is what the descent machinery consumes.
- Check which Frobenius convention a consumer needs: 13.1 defines P_ell with Fr_ell^{-1} and 13.3 computes with Fr_ell. The two differ, and the discrepancy is in the source, not in this packet; a formalisation must fix one convention and re-derive the other.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `eulerSystemDatum` | data | The triple of the lattice, the family of fields and the set of admissible primes. |
| `eulerSystemDatum_polynomials` | data | The Euler polynomials attached to the admissible primes. |
| `eulerSystemDatum_norm` | structure | The norm compatibility the datum must satisfy. |
| `eulerSystemDatum_hypotheses` | characterisation | The hypotheses of the generic Euler-system machine that this datum is claimed to satisfy; the source's Thm. 13.4 and Rubin's Thm. II.3.3 do not package them identically, which is recorded as a gap. |

**Uses.**

- `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`: the bound is applied to this datum

**Unit tests.** A plausible wrong definition fails one of these.

- `euler_polynomial_at_a_good_prime`: At an admissible prime the Euler polynomial is the one the source records, and it is the dual Hecke one.
- `norm_compatibility`: The family satisfies the norm compatibility; a family that satisfies only the level relation is not an Euler system.
- `hypotheses_are_not_free`: The hypotheses of the generic machine must be checked for this datum; hypothesis (v) of the source's theorem is never verified for non-CM forms in the sections read, and that is recorded as a gap.

**Prerequisites.**

- `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`
- `mathlib:MvPolynomial`
- `mathlib:Module.Finite`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, 13.1 (13.1.1), printed pp. 224-225.

  > For m, m' in Sigma such that m | m', the norm map H1(Z[zeta_{m'},1/p],T) -> H1(Z[zeta_m,1/p],T) sends z_{m'} to prod P_ell(ell^{-1} sigma_ell^{-1}) z_m where ell ranges over all prime numbers which divide m' but do not divide m, sigma_ell is the arithmetic Frobenius of ell in Gal(Q(zeta_m)/Q), and we regard P_ell(ell^{-1} sigma_ell^{-1}) as an element of the group ring OL[Gal(Q(zeta_m)/Q)]

  Gives the definition of an Euler system used by Kato, with the corestriction, the arithmetic-Frobenius convention and the evaluation at ell^{-1} sigma_ell^{-1}, all recorded in the statement and hypotheses.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Example 13.3, printed p. 225.

  > Let lambda be a place of F lying over p, let r in Z, and let T = V_{O_lambda}(f)(k - r). Fix an integer j such that 1 <= j <= k - 1, and fix non-zero integers c, d. Let xi be either a symbol of the form a(A) ... or an element of SL2(Z). ... Then (zm)m is an Euler system for (T, F_lambda, Sigma).

  Gives the exact datum, the two branches of xi and their coprimality hypotheses, as recorded in the statement.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Example 13.3, printed p. 225.

  > In fact, for a prime number ell which does not divide Np, we have det_{OL}(1 - Fr_ell^{-1} t : V_{F_lambda}(f)) = 1 - a_ell t + epsilon(ell) ell^{k-1} t^2 ... Hence (zm)m is an Euler System for (T,F_lambda,Sigma) by Prop. 8.12.

  Gives the Euler polynomial for the untwisted representation and names Prop. 8.12 as the proof input, as recorded in the proofSteps.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Example 13.3 (the Euler polynomial), printed p. 225 (transcribed from a page rendering).

  > In fact, for a prime number ell which does not divide Np, we have det_{O_L}(1 - Fr_ell^{-1} . t ; V_{F_lambda}(f)) = 1 - a_ell t + epsilon(ell) ell^{k-1} t^2, and this polynomial has the form (1 - alpha t)(1 - beta t), alpha, beta in C, |alpha| = |beta| = ell^{(k-1)/2}. Hence P_ell(t) = det_{O_L}(1 - Fr_ell . t ; T) = 1 - abar_ell ell^{1-r} t + epsbar(ell) ell^{k+1-2r} t^2, P_ell(ell^{-1} ...

  Supplies the Euler polynomial that the node previously recorded with an illegible exponent, and exhibits the discrepancy with 13.1's definition (Fr_ell^{-1} there, Fr_ell here). Transcribed in review from a rendering of p. 225. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

#### `integral-zeta-submodule-and-finite-index` — The integral zeta submodule Z and its finite index in Z(f,T)

*theorem.* **Planet:** *The integral zeta submodule*.

**Statement.** Let T = V_{O_lambda}(f) and let Z be the Lambda-submodule of H^1(V_{O_lambda}(f)) generated by the two explicitly listed families of p-adic zeta elements: (1) (c,d-z^{(p)}_{p^n}(f,k,j,a(A),prime(p*A)))_{n >= 1} for 1 <= j <= k-1, a, A in Z with A >= 1, and c, d with (c,6pA) = (d,6pN) = 1; and (2) (c,d-z^{(p)}_{p^n}(f,k,j,alpha,prime(p*N)))_{n >= 1} for 1 <= j <= k-1, alpha in SL_2(Z), and c, d with (c*d,6pN) = 1 and c = d = 1 mod N. Then Z is contained in Z(f,T), the Lambda-submodule generated by the classes z_gamma^{(p)} for gamma in T, and the quotient Z(f,T)/Z is a finite group.

**Hypotheses.**

- Lambda = O_lambda[[G_infinity]] with G_infinity = Gal(Q(zeta_{p^infinity})/Q); this is a two-dimensional complete semi-local ring, not a regular local ring, and its height-one primes containing p need separate treatment
- family (2) imposes the extra congruence c = d = 1 mod N, which family (1) does not
- the conclusion is finiteness of the quotient, not equality: the integrally defined submodule Z is in general strictly smaller than Z(f,T)

**Construction, or proof, in steps.**

1. Z consists of explicitly constructed classes, so it is manifestly contained in H^1 of the integral lattice; Z(f,T) is defined through the F_lambda-linear map gamma -> z_gamma^{(p)} of Thm. 12.5(1).
2. The inclusion Z in Z(f,T) follows from the construction of z_gamma^{(p)} as an F_lambda-linear combination of the listed elements.
3. Finiteness of the index uses the generation statement of Thm. 13.6 (Ash-Stevens) that V_{k,Z}(Y(L)) is generated over Z by the classes sigma^* delta_{1,L}(k,j).

**Acceptance.**

- Check that the two families are genuinely different data: family (1) carries the auxiliary parameter A and the bad-Euler-factor information, family (2) carries the delicate integrality but cannot see bad Euler factors (Kato's remark in 8.1).
- Check that finiteness of Z(f,T)/Z is what converts a rational divisibility into an integral one up to a bounded power of p, and that Kato does not claim the index is 1.
- Check that no residual-irreducibility hypothesis is used in this statement, in contrast with Thm. 12.4(3) and Thm. 12.5(4).

**Prerequisites.**

- `mathlib:Module.Finite`
- `mathlib:IsNoetherianRing`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 12.6, printed p. 222.

  > Let T = V_{O_lambda}(f) (8.3). Let Z be the Lambda-submodule of H1(V_{O_lambda}(f)) generated by the following elements ... Then Z in Z(f,T) and Z(f,T)/Z is a finite group.

  Gives the conclusion verbatim, including that the index is finite rather than trivial.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 12.6(1)(2), printed p. 222.

  > (1) c,d z^{(p)}_{p^n}(f,k,j,a(A), prime(pA))_{n>=1} in H1(T) (1 <= j <= k-1, a, A in Z, A >= 1, c,d in Z, (c,6pA) = (d,6pN) = 1). (2) c,d z^{(p)}_{p^n}(f,k,j,alpha,prime(pN))_{n>=1} in H1(T) (1 <= j <= k-1, alpha in SL2(Z), c,d in Z, (cd,6pN) = 1, c = d = 1 mod N).

  Gives both generating families with their exact parameter ranges and the extra congruence condition in family (2).

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, 8.1, printed p. 180.

  > In this paper, the p-adic zeta elements in (8.1.2), (8.1.3) and zeta elements in Sec. 5 and Sec. 6 with xi = a(A) will take care of zeta values with bad Euler factors (Euler factors at primes which divide N). Those with xi in SL2(Z) can not take care of bad Euler factors, but will take care of delicate integrality.

  Explains the distinct roles of the two families, recorded in the first acceptance item.

---

## L3 Explicit reciprocity

**Coverage: partial.** Kato Section 9: the dual exponential map on the modular local system with its de Rham target, the generalised explicit reciprocity law in its three p-Euler-factor cases, the canonical zeta class and its interpolation of the complex L-values, and Beilinson's regulator formula for the K_2 element. The reciprocity law is imported by the source itself from a companion paper, which is recorded as a gap. The audit records the layer as not built.

**Remaining in this layer:**

- Kato Sec. 10 (beyond its opening paragraph) and Sec. 11 were not read: these contain B_dR for non-perfect residue fields and the compatibility (10.9.5) of two dual exponential maps, which is the internal input to Thm. 9.5.
- The imported generalised explicit reciprocity law of [KK3] (Kato, 'Generalized explicit reciprocity laws') was not read at all; it is the load-bearing external theorem behind Thm. 9.5.
- Kato Sec. 7 (the proofs of the zeta value formulas, including Thm. 2.6) was not read, so the archimedean regulator comparison node rests on the statement only.
- The exact constant in Thm. 12.5(1) (including the power of 2 pi i and the normalising periods per_f^{pm}) was not transcribed: the digitisation of printed p. 221 is incomplete at that display.
- The stage text asks for a comparison with the analytic distribution of ModularSymbolsPadicLFunctions L3 in the critical-slope case. Kato's Sec. 16-17 treat the ordinary case only; the critical-slope comparison has no counterpart in the sections read and no supplier edge is proposed.

The explicit reciprocity law is the bridge between the `p`-adic and the complex worlds: it
computes the dual exponential of a zeta element, in three cases according to the `p`-Euler factor. Kato does
**not** prove it here - he attributes it to a companion paper - and this packet does not pretend otherwise: the
node records the statement and the gap records that the companion paper is unread.

What follows from it is the canonical zeta class and its interpolation of the complex values `L(f, chi, r)`, and
on the archimedean side Beilinson's regulator formula for the `K_2` element.

**Planets of this layer** (3): *The dual exponential map*, *The explicit reciprocity law*, *Interpolation of complex L-values*.

### Nodes (4)

#### `dual-exponential-map-on-the-modular-local-system` — The dual exponential map on V_{k,Q_p}(Y)(i) and its de Rham target

*construction.* **Planet:** *The dual exponential map*.

**Statement.** For a de Rham representation V of Gal(Kbar/K), K a complete discretely valued field of characteristic 0 with perfect residue field of characteristic p, the dual exponential map exp^* : H^1(K,V) -> D^0_dR(V) is the composite H^1(K,V) -> H^1(K,B^0_dR tensor V) = H^0(K,B^0_dR tensor V) = D^0_dR(V), where the middle isomorphism is multiplication by log(chi_cyclo) in H^1(K,Z_p) = Hom_cont(Gal(Kbar/K),Z_p). For Y = G \ Y(N) with N >= 3 and k >= 2, the representation V = V_{k,Q_p}(Y) of Gal(Qbar_p/Q_p) is de Rham with D^i_dR(V) = D_dR(V) for i <= 0, D^i_dR(V) = 0 for i > k, and the graded piece in degrees 1 <= i <= k-1 identified with M_k(X) tensor Q_p for X a smooth compactification of Y. Hence for 1 <= i <= k-1 one obtains exp^* : H^1(Q_p, V_{k,Q_p}(Y)(i)) -> M_k(X) tensor Q_p, since the Tate twist shifts the filtration.

**Hypotheses.**

- V must be de Rham; for V_{k,Q_p}(Y) this is the theorem of Faltings/Tsuji cited by Kato as (9.2.1)-(9.2.2), applied to the proper smooth compactification and the Sym^{k-2} local system
- the normalisation of exp^* involves the specific element log(chi_cyclo) in H^1(K,Z_p); a different generator changes exp^* by a unit, so the constant in any reciprocity law depends on this choice
- 1 <= i <= k-1 is required for the target to be M_k(X) tensor Q_p; outside that range the graded piece is 0 or the whole of D_dR
- Y is affine (a curve of the form G \ Y(N)) but the de Rham comparison is stated for its smooth compactification X, so the identification of D_dR with modular forms of weight k on X is part of the input

**Construction, or proof, in steps.**

1. Multiply by log(chi_cyclo) to identify H^1(K,B^0_dR tensor V) with H^0(K,B^0_dR tensor V); this is the standard Bloch-Kato/Kato construction cited as [BK2],[KK2].
2. Identify H^0(K, B^0_dR tensor V) with D^0_dR(V) by definition of the filtration on D_dR.
3. For V = V_{k,Q_p}(Y)(i), use the computation of the Hodge filtration in (9.2.2) and the fact that a Tate twist shifts the filtration, to identify D^0_dR(V(i)) = D^i_dR(V) = M_k(X) tensor Q_p.
4. For a newform f, the further quotient V_{F_lambda}(f) of V_{k,Q_p}(Y_1(N)) gives exp^*_f : H^1(Q(zeta_m) tensor Q_p, V_{F_lambda}(f)(i)) -> S(f) tensor_F F_lambda tensor Q(zeta_m) for 1 <= i <= k-1.

**Acceptance.**

- Check the direction of the filtration shift under the Tate twist, so that the target really is M_k(X) tensor Q_p and not a different graded piece.
- Check that D^i_dR(V_{F_lambda}(f)) = S(f) tensor_F F_lambda for 1 <= i <= k-1, i.e. that the eigenform quotient has a one-dimensional relevant graded piece.
- Check that exp^* is used here on H^1 of a local field (or a product of local fields Q(zeta_m) tensor Q_p) and not on a global H^1 -- the reciprocity statement is a statement about the localisation at p.

**API.** What a user of this object needs in order to use it without unfolding the definition.

| name | role | statement |
| --- | --- | --- |
| `dualExp` | data | The dual exponential map on the modular local system with its twist. |
| `dualExp_target` | projection | Its de Rham target, the space of modular forms the source names. |
| `dualExp_compat` | compatibility | Its compatibility with the projection to an eigenform. |
| `dualExp_vanishing` | characterisation | Its kernel, which is what makes the reciprocity law a computation rather than a tautology. |

**Uses.**

- `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`: the reciprocity law is an identity for the value of this map on a zeta element

**Unit tests.** A plausible wrong definition fails one of these.

- `weight_two`: For weight two the target is the space of cusp forms of that weight and level.
- `twist_matters`: The map depends on the twist; applying it with the wrong twist gives a map between different spaces.
- `not_the_exponential`: The dual exponential is not the exponential; they are adjoint and have different sources and targets.

**Prerequisites.**

- `mathlib:KaehlerDifferential`
- `mathlib:Padic`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, 9.3, printed pp. 187-188.

  > For a de Rham representation V we have a canonical homomorphism exp* : H1(K, V) -> D^0_dR(V) called the dual exponential map ([BK2], [KK2]). This is defined as the composite H1(K,V) -> H1(K,B^0_dR tensor V) = H0(K,B^0_dR tensor V) = D^0_dR(V) where the middle isomorphism is the product with the element log(chi_cyclo) in H1(K,Zp) = Hom_cont(Gal(Kbar/K),Zp)

  Gives the construction of exp^* and its normalisation by log(chi_cyclo), recorded in the statement and hypotheses.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, (9.2.2), printed p. 187.

  > Let Y be a curve of the form G\Y(N) with N >= 3 and with a subgroup G of GL2(Z/N). Let k >= 2, and let V = Vk,Qp(Y) (8.3). Then V is a de Rham representation of Gal(Qp bar/Qp), and D^i_dR(V) = D_dR(V) for i <= 0, D^i_dR(V) = 0 for i > k, D^i_dR(V) = Mk(X) tensor Qp for 1 <= i <= k - 1, where X is a smooth compactification of Y.

  Gives the de Rham property and the exact Hodge filtration of the modular local system, including the range 1 <= i <= k-1.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, 9.4, printed p. 188.

  > For k >= 2 and 1 <= i <= k - 1, consider the dual exponential maps (9.4.1) exp* : H1(Qp, Vk,Qp(Y)(i)) -> Mk(X) tensor Qp. Here to define (9.4.1), we used the fact D^0_dR(Vk,Qp(Y)(i)) = D^i_dR(Vk,Qp(Y)) = Mk(X) tensor Qp (Tate twist shifts the filtration of D_dR).

  Confirms the target of (9.4.1) and the role of the Tate twist, recorded in the third proofStep.

#### `generalised-explicit-reciprocity-law-for-zeta-elements` — Kato's generalised explicit reciprocity law (Thm. 9.5) in its three p-Euler-factor cases

*theorem.* **Planet:** *The explicit reciprocity law*.

**Statement.** Let the notation be as in (8.1.1). Assume 1 <= r <= k-1, that at least one of r, r' equals k-1, and that prime(M) is contained in prime(N); assume further M >= 2 in the case (r,r') = (k-2,k-1). Then the dual exponential map (9.4.1) with Y = Y(M,N) and i = k-r sends the image of c,d-z^{(p)}_{M,N}(k,r,r') in H^1(Q_p, V_{k,Q_p}(Y(M,N))(k-r)) to the following element of M_k(X(M,N)) tensor Q_p: c,d-z_{M,N}(k,r,r') if p divides M; (1 - T'(p)<1/p,1>^*) c,d-z_{M,N}(k,r,r') if (p,M) = 1 and p divides N; and (1 - T'(p)<1/p,1>^* + <1/p,1/p>^* p^{k-1-2r}) c,d-z_{M,N}(k,r,r') if (p,M*N) = 1. Correspondingly, Thm. 9.6 gives the statement for the elements (8.1.2) over Q(zeta_m) tensor Q_p, and Thm. 9.7 the statement for the eigenform elements (8.1.3) with exp^*_f landing in S(f) tensor_F F_lambda tensor Q(zeta_m).

**Hypotheses.**

- 1 <= r <= k-1 and at least one of r, r' equal to k-1; the theorem is NOT asserted for general pairs (r,r')
- prime(M) contained in prime(N) -- an inclusion of prime sets, the same hypothesis as in the archimedean regulator theorem 2.6
- the extra hypothesis M >= 2 in the single exceptional case (r,r') = (k-2,k-1)
- the three cases are distinguished by the p-divisibility of M and of N, and give the three Euler factors of 2.5 at ell = p; the exponent k-1-2r is the same one occurring in Prop. 8.7(2)
- the target element c,d-z_{M,N}(k,r,r') is the zeta element in the space of modular forms constructed in Sec. 4, not the K_2 element of Sec. 2

**Construction, or proof, in steps.**

1. Kato deduces Thm. 9.5 from the generalised explicit reciprocity law of his separate paper [KK3] ('Generalized explicit reciprocity laws'), applied to the p-adic completion of the function field of a modular curve, i.e. to a complete discretely valued field whose residue field is NOT perfect.
2. Section 10 develops B_dR for non-perfect residue fields (attributed to unpublished work of Tsuzuki and to [KK3, Sec. 2]) and the corresponding dual exponential map.
3. The deduction uses the compatibility of two dual exponential maps, stated as (10.9.5) and proved in Section 11 ('Modular forms and B_dR').
4. Thm. 9.6 follows from Thm. 9.5 together with Prop. 4.4 (the relation between the (8.1.1) and (8.1.2) families); Thm. 9.7 follows from Thm. 9.6 by projecting to the f-eigenspace.

**Acceptance.**

- Check that the three cases of Thm. 9.5 match, factor for factor, the three cases of the Euler factor of Z_{M,N}(s) printed in 2.5 at ell = p; in particular that the p | M case has trivial factor.
- Check the exceptional hypothesis M >= 2 when (r,r') = (k-2,k-1): a reciprocity statement that omits it is not the source statement.
- Check that the theorem computes exp^*, i.e. the image in the degree-(k-r) graded piece, and does not by itself give the Bloch-Kato exponential or a statement about the whole local class.
- Check the deduction chain 9.5 -> 9.6 -> 9.7 and, in particular, that Prop. 4.4 is an input that must be verified separately.

**Prerequisites.**

- `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system`
- `mathlib:Padic`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, Thm. 9.5, printed p. 188.

  > Let the notation be as in (8.1.1). Assume 1 <= r <= k - 1, at least one of r, r' is k - 1, and prime(M) in prime(N). Assume further that M >= 2 in the case (r,r') = (k - 2, k - 1). Then the dual exponential map (9.4.1) with Y = Y(M,N) and i = k - r sends the image of c,d z^{(p)}_{M,N}(k,r,r') in H1(Qp, Vk,Qp(Y(M,N))(k-r)) to the following element of Mk(X(M,N)) tensor Qp: c,d ...

  Gives all hypotheses (including the exceptional M >= 2 case) and all three Euler-factor cases with the exponent k-1-2r, exactly as recorded. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, Sec. 10 opening, printed p. 189.

  > In this section, we deduce Thm. 9.5 from a generalized explicit reciprocity law proved in [KK3]. In this proof, we use the compatibility of two dual exponential maps (10.9.5) and this compatibility is proved in Sec. 11.

  States explicitly that Thm. 9.5 is deduced from an external result [KK3] plus the internal compatibility (10.9.5); this is the import boundary recorded in the packet gaps.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, 10.1, printed p. 189.

  > In 10.1-10.5, let K be a complete discrete valuation field of characteristic 0 with residue field k of characteristic p. We assume [k : k^p] < infinity. In our application, K will be a p-adic completion of the function field of a modular curve.

  Confirms that the reciprocity law is applied over a non-perfect residue field, as recorded in the proofSteps.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter II, Thm. 9.7, printed p. 189.

  > Then the map exp*_f : H1(Q(zeta_m) tensor Qp, V_{F_lambda}(f)(r)) -> S(f) tensor_F F_lambda tensor Q(zeta_m) sends the image of c,d z^{(p)}_m(f,r,r',xi,S) to c,d z_m(f,r,r',xi,S) in S(f) tensor_F F_lambda tensor Q(zeta_m). This follows from Thm. 9.6.

  Gives the eigenform form of the reciprocity law and records that it is deduced from Thm. 9.6.

#### `zeta-class-interpolation-of-complex-L-values` — The canonical zeta class z_gamma^{(p)} and its interpolation of L(f,chi,r)

*theorem.* **Planet:** *Interpolation of complex L-values*.

**Statement.** There is a unique F_lambda-linear map V_{F_lambda}(f) -> H^1(V_{F_lambda}(f)), gamma -> z_gamma^{(p)}, with the following property: for 1 <= r <= k-1, n >= 0 and gamma in V_F(f) (the F-rational subspace, not all of V_{F_lambda}(f)), the image of z_gamma^{(p)} under the composite (restrict to Q(zeta_{p^n}) tensor Q_p; multiply by (zeta_{p^n})_n^{(-r)}; apply exp^*) lies in S(f) tensor_Q Q(zeta_{p^n}); and for any character chi : G_n -> C^x the twisted period map S(f) tensor_Q Q(zeta_{p^n}) -> V_C(f)^{pm}, x tensor y -> sum over sigma in G_n of chi(sigma) sigma(y) per_f(x)^{pm}, with pm = (-1)^{k-r-1} chi(-1), sends that image to (2 pi i)^{k-r-1} . L_{{p}}(f^*, chi, r) . gamma^{pm}. The L-function is that of the DUAL form f^*, not of f; this was transcribed from a rendering of printed p. 221 because the text layer drops the display. Moreover the Lambda tensor Q-submodule Z(f) generated by the z_gamma^{(p)} has H^1(V_{F_lambda}(f))/Z(f) a torsion Lambda tensor Q-module, and z_{t(gamma)}^{(p)} = -sigma_{-1} z_gamma^{(p)} for t the action of complex conjugation.

**Hypotheses.**

- 1 <= r <= k-1: the interpolation is over the critical strip only
- the sign decomposition is pm = (-1)^{k-r-1} chi(-1), so the parity of the period per_f(x)^{pm} is determined jointly by r, k and the parity of chi
- the L-value is L_{{p}}(f^*, chi, r): the L-function OF THE DUAL FORM f^*, with the Euler factor at p removed. Both features matter -- a consumer that writes L(f,chi,r) has the wrong form, and one that writes the complete L-function has the wrong Euler factor
- the map gamma -> z_gamma^{(p)} is F_lambda-linear on the two-dimensional V_{F_lambda}(f), so Z(f) is generated by the images of a basis
- the torsion statement for H^1/Z(f) is over Lambda tensor Q, not over Lambda

**Construction, or proof, in steps.**

1. The elements of Thm. 12.6's two families, viewed in H^1(V_{F_lambda}(f)), give enough classes; uniqueness of the F_lambda-linear map follows from the interpolation property, which determines its values at infinitely many characters.
2. The interpolation property itself is the combination of the explicit reciprocity law (Thm. 9.7) with the archimedean zeta-value formula of Sec. 6 (Thm. 6.6), which expresses the modular-form zeta elements in terms of complex L-values.
3. The torsion statement H^1/Z(f) torsion over Lambda tensor Q uses Thm. 12.4(2) (H^1(V_{F_lambda}(f)) free of rank 1 over Lambda tensor Q) together with nonvanishing of Z(f) at every height-0 prime (Prop. 13.7).

**Acceptance.**

- Check the transcribed constant (2 pi i)^{k-r-1} L_{{p}}(f^*, chi, r) gamma^{pm} against a clean edition, and check the definition of per_f (Kato's table of special notation), which this packet has NOT read: per_f is what fixes the period normalisation and hence the dictionary demanded by the L3 stage text.
- Check the sign rule pm = (-1)^{k-r-1} chi(-1) against the parity of the periods per_f^{pm} and against the relation z_{t(gamma)} = -sigma_{-1} z_gamma.
- Check that the L-value is the p-imprimitive one and that this is the source of the Euler factor at p appearing in Thm. 9.5's third case.
- Check that Z(f) is a Lambda tensor Q-module and that its integral counterpart Z(f,T) requires the separate statement Thm. 12.5(4).

**Prerequisites.**

- `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`
- `mathlib:DirichletCharacter`
- `mathlib:LSeries`
- `mathlib:IsCyclotomicExtension`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 12.5(1), printed p. 221 (transcribed from a page rendering).

  > There exists a unique F_lambda-linear map V_{F_lambda}(f) -> H1(V_{F_lambda}(f)) ; gamma -> z_gamma^{(p)} having the following property : Let r in Z, 1 <= r <= k - 1, let n >= 0, and let gamma in V_F(f). Then the image of z_gamma^{(p)} under the composite map H1(V_{F_lambda}(f)) = H1(V_{F_lambda}(f)(k-r)) -> H1(Q_p(zeta_{p^n}), V_{F_lambda}(f)(k-r)) --exp*--> S(f) tensor_F F_lambda ...

  Gives the whole of Thm. 12.5(1) including the constant and the DUAL form f^*, transcribed in review from a rendering of p. 221; the node previously recorded the L-value as that of f and left the constant untranscribed. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 12.5(2), printed p. 221.

  > Let Z(f) be the Lambda tensor Q-submodule of H1(V_{F_lambda}(f)) generated by z_gamma^{(p)} for all gamma in V_{F_lambda}(f). Then H1(V_{F_lambda}(f))/Z(f) is a torsion Lambda tensor Q-module.

  Gives the torsion statement over Lambda tensor Q recorded in the statement.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 12.4(2), printed p. 221.

  > H1(T) is a torsion free Lambda-module, and H1(T) tensor Q = H1(V_{F_lambda}(f)) is a free Lambda tensor Q-module of rank 1.

  Supplies the freeness input used in the third proofStep.

#### `beilinson-regulator-and-the-archimedean-zeta-value` — Beilinson's regulator formula for the K_2 zeta element (Kato Thm. 2.6)

*comparison.*

**Statement.** Assume prime(M) is contained in prime(N). Then the Beilinson regulator reg_{M,N} : K_2(Y(M,N)) -> H^1(Y(M,N)(C), R(2)) sends z_{M,N} to the value at the appropriate point of the operator-valued zeta function Z_{M,N}(s) applied to the special class delta_{M,N}, where delta_{M,N} in H^1(Y(M,N)(C),Z) is the class obtained by Poincare duality from the relative homology class of the path phi : (0,infinity) -> X(N)(C), y -> nu(y*i), a route from one cusp to another, and Z_{M,N}(s) = sum over (n,M)=1 of T'(n) <1/n,1>^* n^{-s} is the operator-valued zeta function acting on H^1(Y(M,N)(C),C), holomorphic at s not equal to 2 with Z_{M,N}(0) = 0.

**Hypotheses.**

- prime(M) contained in prime(N) -- the same inclusion hypothesis as in Thm. 9.5
- Z_{M,N}(s) converges for Re(s) > 2 and continues meromorphically; the formula is stated at a specific point and involves the derivative/limit there, since Z_{M,N}(0) = 0
- delta_{M,N} is defined by Poincare duality on the OPEN curve Y(M,N)(C), via H^1(Y(M,N)(C),Z) = H_1(X(M,N)(C),{cusps},Z), so the modular-symbol class is a relative homology class and its cusp endpoints matter
- the regulator target is H^1 with R(2)-coefficients; the plus/minus projection (delta pm iota^* delta)/2 by complex conjugation is used to split the statement

**Construction, or proof, in steps.**

1. Kato states that Thm. 2.6 is deduced from Beilinson's work [Be, Sec. 5] and gives his own proof in Sec. 7 ('The proofs of the zeta value formulas').
2. The class delta_{M,N} is constructed in 2.7 by dualising the relative homology class of an explicit path between cusps under H^1(Y(M,N)(C),Z) = Hom(H_1(Y(M,N)(C),Z),Z) = H_1(X(M,N)(C),{cusps},Z).
3. The operator-valued zeta function and its Euler product are recorded in 2.5; its Euler factors are exactly the operators appearing in the norm relation Prop. 2.4.

**Acceptance.**

- Check that the regulator statement and the p-adic reciprocity law (Thm. 9.5) carry the same Euler-factor conventions, so that comparing them does not silently change normalisation.
- Check the cusp endpoints of the path phi and the resulting relative homology class: replacing phi by a loop changes delta_{M,N}.
- Check the vanishing Z_{M,N}(0) = 0 and the precise point at which the formula is evaluated; the OCR of Thm. 2.6's displayed formula is incomplete.

**Prerequisites.**

- `mathlib:LSeries`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, Thm. 2.6, printed p. 127.

  > The following Thm. 2.6 is deduced from the work of Beilinson in [Be, Sec. 5]. We will give the proof of Thm. 2.6 in Sec. 7. Theorem 2.6. Assume prime(M) in prime(N). Then we have ...

  Gives the hypothesis prime(M) in prime(N), the attribution to Beilinson, and the location of Kato's own proof (Sec. 7, not read here).

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.7, printed pp. 127-128.

  > We define delta_{M,N} in H1(Y(M,N)(C),Z) to be the image of class(phi) in H1(X(M,N)(C), {cusps}, Z) under (2.7.1) where phi is the continuous map (0,infinity) -> X(N)(C) ; phi(y) = nu(yi) for 0 < y < infinity, which is a route from a cusp to a cusp.

  Gives the exact definition of delta_{M,N} as the Poincare dual of a relative homology class of a path between cusps.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter I, 2.5, printed p. 127.

  > The function ZM,N(s) has an analytic continuation to the whole C as an operator valued meromorphic function in s, and is holomorphic at s not= 2. Furthermore, ZM,N(0) = 0.

  Gives the analytic properties of the operator-valued zeta function recorded in the hypotheses.

---

## L4 Nonvanishing and the Euler-system divisibility

**Coverage: partial.** Kato Sections 13 and 17: the imported Euler-system bound over the cyclotomic Iwasawa algebra, the nonvanishing of the zeta submodule at every height-zero prime through Ash-Stevens, Jacquet-Shalika and Rohrlich, one divisibility in the cohomological main conjecture, the good-ordinary Selmer divisibility, and the reason the complex-multiplication case is excluded. The reverse divisibility is not proved and Conjecture 12.10 remains a conjecture in the source; this packet plans neither. The audit records the layer as not built.

**Remaining in this layer:**

- Kato Thm. 13.4 is imported and its proof was not read in either Perrin-Riou [Pe4], Rubin [Ru4] or Kato [KK4]. Rubin's Thm. II.3.3 was read as a statement (with its hypotheses Hyp(K_infinity,T), Hyp(K_infinity/K)) but its proof (Rubin Chapters IV, V, VII) was not.
- Kato Sec. 14 (finiteness of Selmer groups and Tamagawa number conjectures) and Sec. 15 (the CM case) were not read; Sec. 15 is the replacement for the Euler-system argument when hypothesis (v) fails.
- Kato Sec. 16 (the construction of the p-adic zeta function L_{p-adic,alpha,omega,gamma}(f)) was not read; Thm. 17.4(2),(3) refer to it and the ord_p on the right-hand side is its valuation.
- Kato 17.6-17.10 (the proofs of Props. 17.1, 17.2 and of Thm. 17.4) were not read; only the statements and the definitions 17.3, 17.5 were inspected.
- The stage text asks for 'the ordinary Selmer divisibility through R07's exact sequences and R09's local image theorem'. The corresponding supplier statements in SelmerIwasawaCohomology and PadicHodgeRegulators were not inspected in this packet, so no edge to them is proposed.

One divisibility, and the honest reasons it is only one. The imported Euler-system bound over
the cyclotomic Iwasawa algebra is requested from the owner of the generic machine; the nonvanishing of the zeta
submodule at every height-zero prime is proved in the source from Ash-Stevens, Jacquet-Shalika and Rohrlich; and
together they give one divisibility in the cohomological main conjecture and, in the good-ordinary case, in the
Selmer main conjecture.

The reverse divisibility is not proved and Conjecture 12.10 remains a conjecture in the source. This packet
plans neither. The complex-multiplication case is excluded from the Euler-system argument, and the reason is a
node of its own rather than a footnote.

**Planets of this layer** (4): *The Euler-system bound*, *Nonvanishing at height zero*, *One divisibility, cohomological*, *One divisibility, ordinary Selmer*.

### Nodes (5)

#### `imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra` — The imported Iwasawa-theoretic Euler-system bound (Kato Thm. 13.4)

*theorem.* **Planet:** *The Euler-system bound*.

**Statement.** Let (T,L,Sigma) be as in 13.1 and let (z_m)_m be an Euler system for it. Let Lambda = O_L[[G_infinity]], let Z be the Lambda-submodule of H^1(T) generated by (z_{p^n})_n, and let J be the ideal of Lambda generated by h(Z) over all Lambda-homomorphisms h : H^1(T) -> Lambda. Put H^2(T)_0 = Ker(H^2(T) -> H^2_loc(T)). Assume (i) Z_q is nonzero for every height-0 prime q of Lambda; (ii) rank_{O_L}(T^+) = rank_{O_L}(T^-) = 1; (iii) there is w in Z such that for every prime ell not in Sigma all eigenvalues of Fr_ell on T tensor L are algebraic numbers all of whose complex conjugates have absolute value ell^{w/2}; (iv) T tensor L is irreducible as a representation of Gal(Qbar/Q) over L; (v) there is sigma in Gal(Qbar/Q(zeta_{p^infinity})) with dim_L Ker(1 - sigma ; T tensor L) = 1. Then (1) H^2(T) is a torsion Lambda-module; (2) for every height-one prime p of Lambda not containing p, length_{Lambda_p}(H^2(T)_{0,p}) <= length_{Lambda_p}(Lambda_p/J_p); (3) if moreover Coker(1 - sigma : T -> T) is free of rank 1 over O_L for some sigma in Gal(Qbar/Q(zeta_{p^infinity})), T tensor O_L/m_L is irreducible over O_L/m_L, and p is not 2, then the bound of (2) holds for every height-one prime p.

**Hypotheses.**

- hypothesis (v) is about Gal(Qbar/Q(zeta_{p^infinity})), i.e. after removing the cyclotomic twists; it fails for CM forms, and Kato treats the CM case separately in Sec. 15
- hypothesis (iv) is irreducibility over Gal(Qbar/Q), whereas the integral refinement (3) requires residual irreducibility and also p not equal to 2
- the bound in (2) excludes height-one primes containing p; only (3) removes that exclusion, and at the cost of the integral hypotheses
- the bounded object is H^2(T)_0 = Ker(H^2(T) -> H^2_loc(T)), not H^2(T) itself; the difference is controlled by the local term H^2_loc, which Kato computes by local Tate duality in 12.2
- the bounding ideal is J, the image ideal of Z under all Lambda-homomorphisms H^1(T) -> Lambda, i.e. an index-of-divisibility ideal and not the characteristic ideal of a quotient

**Construction, or proof, in steps.**

1. Kato does not prove Thm. 13.4; he states it as a consequence of the Euler-system machinery of Perrin-Riou [Pe4], Rubin [Ru4] and his own [KK4]. The proof is therefore an import.
2. In Rubin's monograph the corresponding statement is Thm. II.3.3: for an Euler system c for (T,K_infinity) with T satisfying Hyp(K_infinity,T) and Hyp(K_infinity/K), char(X_infinity) divides ind_Lambda(c), where X_infinity = Hom_O(S_{Sigma_p}(K_infinity,W^*),D) and ind_Lambda(c) = {phi(c_{K,infinity}) : phi in Hom_Lambda(H^1_infinity(K,T),Lambda)}.
3. Rubin's Hyp(K_infinity,T) requires a tau in G_{K_infinity} acting trivially on mu_{p^infinity}, on (O_K^x)^{1/p^infinity} and on K(1), with T/(tau-1)T free of rank one over O, plus irreducibility of T tensor k as a k[G_{K_infinity}]-module. Kato's (iv)+(v) are phrased with irreducibility over Gal(Qbar/Q) and a rank condition over L, so the two hypothesis packages are related but not literally identical.
4. Kato records that in the situation of Example 13.3 hypotheses (ii), (iii), (iv) hold, citing Deligne for (iii) (the Weil bound for the Hecke eigenvalues) and Ribet for (iv) (irreducibility of the modular representation).
5. Rubin's second hypothesis Hyp(K_infinity/K) is a weak technical assumption which the draft says is 'satisfied if K = Q' (p. 27); since Kato works over K = Q it is automatic, so the whole of the hypothesis mismatch with Kato's (i)-(v) lies in Hyp(K_infinity,T) and in the identification of the bounded objects.

**Acceptance.**

- Check the translation between Kato's H^2(T)_0 and Rubin's X_infinity: both are dual Selmer objects with no condition at p, but the identification requires Poitou-Tate and the relation between H^2(T) and the dual of S_{Sigma_p}(K_infinity,W^*).
- Check whether Kato's (iii)+(iv) imply Rubin's irreducibility over G_{K_infinity} = Gal(Qbar/Q(zeta_{p^infinity})). This is not asserted in Sec. 13 and is recorded as an open import boundary.
- Check that (2) and (3) are genuinely different statements: the first excludes primes containing p, and any application that needs the whole characteristic ideal must verify the hypotheses of (3).
- Check that a zero Euler system gives J = 0 and hence a vacuous bound, so hypothesis (i) is essential (Rubin's Remark 2.8 makes the same point for indO(c)).

**Prerequisites.**

- `EulerSystemsAndKolyvaginSystems:ES.8`
- `KatoEulerSystems:L2/euler-system-datum-for-the-modular-lattice`
- `KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero`
- `mathlib:IsNoetherianRing`
- `mathlib:Ideal.height`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 13.4, printed p. 226.

  > Let (T, L, Sigma) be as in 13.1, and let (zm)m be an Euler system for (T, L, Sigma). Let Lambda = OL[[G_infinity]]; let Z be the Lambda-submodule of H1(T) generated by (z_{p^n})_n, and let J be the ideal of Lambda generated by h(Z) for all Lambda-homomorphisms h : H1(T) -> Lambda. On the other hand, let H2(T)0 = Ker(H2(T) -> H2_loc(T)). Assume the following (i) Zq is nonzero for any prime ...

  Gives the five hypotheses verbatim and the definitions of Z, J and H^2(T)_0, exactly as recorded in the statement. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 13.4(2)(3), printed p. 226.

  > (2) Let p be a prime ideal of Lambda of height one which does not contain p. Then length_{Lambda_p}(H2(T)_{0,p}) <= length_{Lambda_p}(Lambda_p/J_p). (3) Assume that there exists an element sigma of Gal(Qbar/Q(zeta_{p^infinity})) such that Coker(1 - sigma : T -> T) is a free O_L-module of rank 1, and assume that T tensor_{OL} O_L/m_L is irreducible as a representation of Gal(Qbar/Q) over ...

  Gives the two bounds and the extra integral hypotheses of (3), including p not equal to 2. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, 13.1 and after Thm. 13.4, printed pp. 224, 226.

  > We use results on Euler systems in Perrin-Riou [Pe4], Rubin [Ru4], and [KK4]. ... In the case of 13.3, the conditions (ii), (iii), (iv) in Thm. 13.4 are satisfied ((iii) is due to Deligne [De1], and (iv) is due to Ribet [Ri1]). However if f has CM, this theorem is not applied because the condition (v) is not satisfied in the CM case.

  Records both that Thm. 13.4 is imported and which of its hypotheses Kato verifies in the modular case, including the explicit failure of (v) for CM forms.

- rubin-euler-systems-draft — Karl Rubin, *Euler systems (author's course draft of the Annals of Mathematics Studies 147 monograph)*, Chapter II, Thm. 3.3, printed p. 28.

  > Theorem 3.3. Suppose c is an Euler system for (T, K_infinity), and T satisfies hypotheses Hyp(K_infinity, T) and Hyp(K_infinity/K). Then char(X_infinity) divides ind_Lambda(c).

  This is the form in which the imported bound appears in Rubin's monograph; the node's proofSteps record that Kato's hypothesis package (i)-(v) is not literally Rubin's Hyp(K_infinity,T) plus Hyp(K_infinity/K).

- rubin-euler-systems-draft — Karl Rubin, *Euler systems (author's course draft of the Annals of Mathematics Studies 147 monograph)*, Chapter II, Hyp(K_infinity,T), printed p. 27.

  > Hypotheses Hyp(K_infinity, T). (i) There is a tau in G_{K_infinity} such that tau acts trivially on mu_{p^infinity}, on (O_K^x)^{1/p^infinity}, and on K(1), T/(tau - 1)T is free of rank one over O. (ii) T tensor k is an irreducible k[G_{K_infinity}]-module.

  Gives Rubin's hypothesis package verbatim, showing that the irreducibility is required over G_{K_infinity} whereas Kato's (iv) is stated over Gal(Qbar/Q).

- rubin-euler-systems-draft — Karl Rubin, *Euler systems (author's course draft of the Annals of Mathematics Studies 147 monograph)*, Chapter II, Hyp(K_infinity/K) and Def. 3.1, printed p. 27.

  > Hypothesis Hyp(K_infinity/K). If rank_{Zp}(Gamma) = 1 and G_{K_infinity} acts either trivially or by the cyclotomic character on V, then either K is a totally real field and Leopoldt's conjecture holds for K ..., or K is an imaginary quadratic field. [Preceded by:] We will need the following weak assumption to rule out some very special bad cases. In particular it is satisfied if K = Q. ...

  Shows that Rubin's second hypothesis is automatic over Q, and gives the definitions of X_infinity and ind_Lambda(c) that the comparison with Kato's H^2(T)_0 and J must go through; added in review. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

#### `nonvanishing-of-the-zeta-submodule-at-height-zero` — Nonvanishing of Z at every height-zero prime (Kato Prop. 13.7)

*theorem.* **Planet:** *Nonvanishing at height zero*.

**Statement.** Let Z be the Lambda-submodule of H^1(V_{O_lambda}(f)) defined in Thm. 12.6. Then Z_q is nonzero for every height-0 prime q of Lambda; that is, hypothesis (i) of Thm. 13.4 holds for the modular Euler system. The proof combines: Ash-Stevens' generation theorem (Thm. 13.6), which for L >= 3 exhibits V_{k,Z}(Y(L)) as generated over Z by the classes sigma^* delta_{1,L}(k,j) for sigma in GL_2(Z/L) and 1 <= j <= k-1; the archimedean zeta-value formula (Thm. 6.6) and the explicit reciprocity law (Thm. 9.7); and the analytic nonvanishing results of Thm. 13.5, namely Jacquet-Shalika's theorem that L(f,s) has no zero on Re(s) >= (k+1)/2 and Rohrlich's theorem that for k even and a finite set S of primes, the set of Dirichlet characters chi of S-power conductor with L_S(f,chi,k/2) = 0 is finite.

**Hypotheses.**

- Thm. 13.5(2) (Rohrlich) is stated for k EVEN; the nonvanishing input is therefore not available verbatim for odd weight at the central point
- Thm. 13.5(1) (Jacquet-Shalika) gives nonvanishing only on the half-plane Re(s) >= (k+1)/2, so the central point s = k/2 is exactly the boundary case handled by Rohrlich
- the conclusion is about height-0 primes of Lambda, i.e. after inverting everything of positive height; it does not say Z is nonzero modulo a given height-one prime
- the argument needs infinitely many finite-order characters chi of G_infinity with prescribed sign chi(-1) = pm

**Construction, or proof, in steps.**

1. By Thm. 13.6 there are sigma in SL_2(Z) and 1 <= j <= k-1 with the modular symbol class delta(f,j,sigma)^{pm} nonzero, where the sign pm is chosen so that the image of -sigma_{-1} in Lambda_q is pm 1.
2. Choose c, d with (c*d,6p) = 1, c = d = 1 mod N, c^2 not equal to 1 and d^2 not equal to 1, so that the corresponding element of the family (2) of Thm. 12.6 is defined and nondegenerate.
3. By Thm. 6.6 (archimedean zeta values), Thm. 9.7 (explicit reciprocity) and Thm. 13.5 (analytic nonvanishing), for almost all finite-order characters chi : G_infinity -> F_lambda^x with chi(-1) = pm the class is sent to a nonzero element under the composite map (13.7.1) (localise at p, apply exp^*, project by chi).
4. The composite (13.7.1) factors through H^1(V)/p H^1(V) for p the height-one prime corresponding to kappa^{-r} chi^{-1}; hence the image of Z in H^1(V)/p H^1(V) is nonzero for infinitely many height-one primes p containing q, which forces Z_q to be nonzero.

**Acceptance.**

- Check the weight parity constraint: Rohrlich's theorem as quoted assumes k even, so an odd-weight instantiation of this argument needs a different nonvanishing input.
- Check that the characters used are of finite order and that 'almost all' means all but finitely many in the sense of Thm. 13.5(2).
- Check that the argument produces infinitely many height-one primes above a given height-zero prime q -- a single nonvanishing specialisation would not suffice.
- Check the choices c^2 not equal to 1 and d^2 not equal to 1: these prevent the smoothing operators (c^2 - <c>)(d^2 - <d>) from annihilating the class.

**Prerequisites.**

- `KatoEulerSystems:L3/zeta-class-interpolation-of-complex-L-values`
- `mathlib:Ideal.height`
- `mathlib:Ideal.IsPrime`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Prop. 13.7, printed p. 227.

  > Define Z in H1(V_{O_lambda}(f)) as in Thm. 12.6. Then Zq is nonzero for any prime ideal q of Lambda of height 0. Proof. Let pm be + (resp. -) if the image of -sigma_{-1} in Lambda_q is 1 (resp. -1). By 13.6, for some sigma in SL2(Z) and some integer j such that 1 <= j <= k - 1, we have delta(f,j,sigma)^{pm} nonzero. Take such sigma, j and take integers c, d such that (cd, 6p) = 1, c = d = ...

  Gives the statement and the opening of the proof, including the sign convention and the exact conditions on c and d recorded in the second proofStep. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 13.5, printed pp. 226-227.

  > (1) (Jacquet-Shalika [JS]). L(f, s) has no zero on Re(s) >= (k+1)/2 (2) (Rohrlich [Ro2]). Assume k is even. Let S be a finite set of prime numbers. Then the set of chi in union Hom((Z/m)x, Cx) with prime(m) in S such that LS(f,chi, k/2) = 0 is finite.

  Gives the two analytic inputs with their hypotheses, in particular the weight-parity condition in (2) recorded as a hypothesis.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 13.6, printed p. 227.

  > Theorem 13.6 (Ash-Stevens [AS]). Let L >= 3. Then Vk,Z(Y(L)) is generated over Z by the elements sigma* delta_{1,L}(k,j) (sigma in GL2(Z/L), 1 <= j <= k-1).

  Gives the generation theorem used in the first proofStep.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, proof of Prop. 13.7, printed p. 227.

  > The composite map (13.7.1) factors through H1(V_{F_lambda}(f))/p H1(V_{F_lambda}(f)) where p is the kernel of the ring homomorphism Lambda -> F_lambda which sends sigma in G_infinity to kappa(sigma)^{-1} chi(sigma)^{-1}. Hence for infinitely many prime ideals p of Lambda of height one such that p contains q, the image of Z in H1(V_{F_lambda}(f))/p H1(V_{F_lambda}(f)) is not [zero]

  Gives the final step of the argument recorded in the fourth proofStep.

#### `cohomological-divisibility-one-direction` — One divisibility in the cohomological main conjecture for modular forms

*theorem.* **Planet:** *One divisibility, cohomological*.

**Statement.** With Lambda = O_lambda[[G_infinity]] and H^q(T) = lim_n H^q(Z[zeta_{p^n},1/p],T): (a) for every height-one prime p of Lambda not containing p, length_{Lambda_p}(H^2(V_{F_lambda}(f))_p) <= length_{Lambda_p}(H^1(V_{F_lambda}(f))_p / Z(f)_p) + length_{Lambda_p}(H^2_loc(V_{F_lambda}(f))_p), and the local term is nonzero only in the exceptional configuration (12.5.1): k = 2, f not potentially of good reduction at p, p the kernel of the ring map Lambda -> F_lambda induced by kappa^{-2} chi for a finite-order character chi, in which case that local length equals 1. (b) If p is not 2 and T admits a basis for which the image of Gal(Qbar/Q(zeta_{p^infinity})) -> GL_2(O_lambda) contains SL_2(Z_p) (condition (12.5.2)), then Z(f,T) is contained in H^1(T) and length_{Lambda_p}(H^2(T)_p) <= length_{Lambda_p}(H^1(T)_p / Z(f,T)_p) for every height-one prime p except in the configuration (12.5.1). This is one inequality of Conjecture 12.10 (the main conjecture for modular forms), whose statement asserts equality; the reverse inequality is not proved here.

**Hypotheses.**

- (a) excludes height-one primes containing p; (b) removes that exclusion only under (12.5.2) and p not 2
- (12.5.2) is a large-image condition on the restriction to Gal(Qbar/Q(zeta_{p^infinity})); by Ribet's theorem it holds for almost all lambda when f has no CM, and Kato notes that if it holds for one stable lattice it holds for all
- the exceptional configuration (12.5.1) is genuinely present and contributes a local length 1; it occurs only in weight 2 with f not potentially of good reduction at p
- the conclusion is an inequality of lengths at each height-one prime, equivalent to a divisibility of characteristic ideals; Conjecture 12.10 asserts the corresponding equality and remains a conjecture in Kato's text
- the CM case is excluded from the Euler-system proof because hypothesis (v) of Thm. 13.4 fails; Kato treats it separately in Sec. 15

**Construction, or proof, in steps.**

1. Instantiate Thm. 13.4 with the Euler system datum of Example 13.3 (node .../euler-system-datum-for-the-modular-lattice).
2. Verify hypothesis (i) by Prop. 13.7, and hypotheses (ii), (iii), (iv) as recorded by Kato (Deligne for the Weil bound, Ribet for irreducibility).
3. Hypothesis (v) is NOT verified in the sections read. Kato states that (ii), (iii) and (iv) hold in the situation of 13.3 and that (v) fails in the CM case, but he nowhere says, in Sec. 12-13, how (v) is obtained for a form without CM. The large-image statements (12.8.1) and (12.8.2) make it plausible -- an image containing an open subgroup of SL_2(Z_p) certainly contains an element with a one-dimensional fixed space -- but that deduction is this packet's, not the source's, and is recorded as a gap.
4. Convert the bound on H^2(T)_0 = Ker(H^2(T) -> H^2_loc(T)) into a bound on H^2(T) by adding the local term, whose structure is computed in 12.2 by local Tate duality: H^2_loc(T) = Hom(H^0(Q_p(zeta_{p^infinity}), Hom_{Z_p}(T,Q/Z)), Q/Z)(-1).
5. Pass from Z to Z(f,T) using Thm. 12.6 (finite index) for the integral statement.

**Acceptance.**

- Check that the divisibility obtained is stated at each height-one prime separately and is not upgraded to an equality anywhere in Sec. 12-13.
- Check the exceptional configuration (12.5.1) explicitly in a weight-2 multiplicative-reduction example; a statement without the local term is not the source statement.
- Check that (12.5.2) is a hypothesis on the image of the restricted Galois representation, and that the conclusion Z(f,T) contained in H^1(T) is part of (b), not an input.
- Check the comparison with the classical case recorded in 12.9: for T = Z_p(1), H^1 and H^2 of Z[zeta_{p^n},1/p] are the p-completed units and the class group, and the corresponding equality is the Mazur-Wiles theorem.
- Check where hypothesis (v) of Thm. 13.4 is actually established for non-CM f; the sections read state only that it FAILS in the CM case. Until that is located, the divisibility should be quoted with '(v) as verified elsewhere' rather than as fully sourced here.

**Prerequisites.**

- `KatoEulerSystems:L4/cm-exclusion-and-the-separate-treatment`
- `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`
- `mathlib:Ideal.height`
- `mathlib:Module.Finite`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 12.5(3), printed pp. 221-222.

  > Let p be a prime ideal of Lambda of height one which does not contain p. Then length_{Lambda_p}(H2(V_{F_lambda}(f))_p) <= length_{Lambda_p}(H1(V_{F_lambda}(f))_p/Z(f)_p) + length_{Lambda_p}(H2_loc(V_{F_lambda}(f))_p). If H2_loc(V_{F_lambda}(f))_p not= 0, then f and p satisfy the following (12.5.1) k = 2, f is not potentially of good reduction at p (12.7), p is the kernel of the ring ...

  Gives inequality (a), the exclusion of primes containing p, and the exact exceptional configuration with its local length 1. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Thm. 12.5(4) and (12.5.2), printed p. 222.

  > (12.5.2) There exists an O_lambda-basis of T for which the image of the homomorphism Gal(Qbar/Q(zeta_{p^infinity})) -> GL_{O_lambda}(T) = GL2(O_lambda) contains SL2(Zp). ... Then, Z(f,T) in H1(T) in H1(T) tensor Q. Furthermore, length_{Lambda_p}(H2(T)_p) <= length_{Lambda_p}(H1(T)_p/Z(f,T)_p) for any prime ideal of Lambda of height one unless f and p satisfy (12.5.1) in (3).

  Gives statement (b) with its large-image hypothesis and the p not equal to 2 requirement stated just before it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Conjecture 12.10, printed pp. 223-224.

  > Conjecture 12.10 (main conjecture). Let T be a Gal(Qbar/Q)-stable O_lambda-lattice of V_{F_lambda}(f) and let p be a prime ideal of Lambda of height one. In the case p = 2, assume p does not contain 2. Then Z(f,T)_p in H1(T)_p and length_{Lambda_p}(H2(T)_p) = length_{Lambda_p}(H1(T)_p/Z(f,T)_p).

  Confirms that equality is the conjecture and that Kato proves only the inequality; this is the basis for the node's final sentence.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, 12.9, printed pp. 223-224.

  > The classical Iwasawa main conjecture proved by Mazur-Wiles [MW] states length_{Zp[[G_infinity]]+}(H2(Zp(1))+)_p = length_{Zp[[G_infinity]]+}(H1(Zp(1))+/Z)_p for any prime ideal p of Lambda of height one.

  Gives the classical comparison recorded in the last acceptance item.

#### `ordinary-selmer-divisibility` — The good-ordinary Selmer divisibility against the p-adic zeta function

*theorem.* **Planet:** *One divisibility, ordinary Selmer*.

**Statement.** Suppose f has good ordinary reduction at lambda, i.e. (Prop. 17.1) p does not divide N and a_p is a unit in O_lambda; equivalently V_{F_lambda}(f) is crystalline at p and contains a unique one-dimensional Gal(Qbar_p/Q_p)-stable subspace V'_{F_lambda}(f) which is unramified. Let T be a Gal(Qbar/Q)-stable O_lambda-lattice, T' = T intersect V'_{F_lambda}(f), T'' = T/T', and define Sel_infinity(T) = lim_n Sel(Q(zeta_{p^n}), T(r))(-r) (independent of r for 1 <= r <= k-1 by Prop. 17.2) and X(T) = Hom_{O_lambda}(Sel_infinity(T), F_lambda/O_lambda), a finitely generated Lambda-module. Then (Thm. 17.4): (1) X(T) is a torsion Lambda-module; (2) for alpha as in 17.1, omega a nonzero element of S(f^*) and gamma in V_F(f^*) with the two sign components nonzero, L_{p-adic,alpha,omega,gamma}(f) lies in Lambda tensor Q and length_{Lambda_p}(X(T)_p) <= ord_p(L_{p-adic,alpha,omega,gamma}(f)) for every height-one prime p not containing p; (3) if in addition omega and gamma are good for some stable lattice in the sense of 17.5, p is not 2, and condition (12.5.2) holds, then L_{p-adic,alpha,omega,gamma}(f) lies in Lambda and the same length inequality holds for every height-one prime p.

**Hypotheses.**

- good ordinary reduction at lambda in the precise sense of Prop. 17.1: p does not divide N AND a_p is a lambda-adic unit; the two conditions together are equivalent to the crystalline-plus-unramified-line condition (iii)
- Prop. 17.2's independence of r holds for 1 <= r <= k-1 and is what makes Sel_infinity(T) well defined; it is proved by identifying the Selmer group with an explicit kernel
- in (2) the p-adic L-function depends on the choices of alpha (the unit root), omega in S(f^*) and gamma in V_F(f^*), and lies a priori only in Lambda tensor Q
- in (3) omega and gamma must be GOOD for the lattice in the sense of 17.5: the image of omega under the composite S(f) tensor_F F_lambda -> D_dR(V_{F_lambda}(f)) -> D_dR(V''_{F_lambda}(f)) must be an O_lambda-basis of H^0(Q_p, Z_p^{ur-hat} tensor T''(k-1)). For weight 2 and T = T_pE(-1) this says omega is a Z_p-basis of the invariant differentials of the Neron model
- condition (12.5.2) is again the large-image hypothesis, and p not equal to 2 is required

**Construction, or proof, in steps.**

1. Prop. 17.1 establishes the ordinary filtration 0 -> T' -> T -> T'' -> 0 with T''(k-1) unramified.
2. Prop. 17.2 identifies lim_n Sel(Q(zeta_{p^n}),T(r))(-r) inside lim_n H^1(Z[zeta_{p^n},1/p], T tensor Q/Z) as the kernel of an explicit localisation map, showing independence of r in the critical range.
3. The cohomological bound of Thm. 12.5(3),(4) is transported to a bound on X(T) using the ordinary filtration and the identification of the local condition at p with the T'-part.
4. The p-adic zeta function L_{p-adic,alpha,omega,gamma}(f) is constructed in Sec. 16 from the same zeta classes; the explicit reciprocity law (Thm. 9.7 / Thm. 12.5(1)) identifies ord_p of it with the index length appearing in the cohomological bound.

**Acceptance.**

- Check that the ordinary hypothesis is used twice: once to define the Selmer local condition at p through the unramified line, and once to construct the p-adic L-function with the unit-root refinement alpha.
- Check the goodness condition 17.5 on omega in a weight-2 example: omega must be a Neron differential, and using a non-Neron differential changes the p-adic L-function by a power of p.
- Check that (1) is a torsion statement for X(T), not for a Selmer group without local conditions; it is the ordinary analogue of the weak Leopoldt statement in Thm. 12.4(1).
- Check that the theorem is one divisibility only; Kato does not assert the reverse divisibility anywhere in Sec. 17.

**Prerequisites.**

- `KatoEulerSystems:L4/cohomological-divisibility-one-direction`
- `mathlib:Module.Finite`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter IV, Prop. 17.1, printed p. 272.

  > The following three conditions (i)-(iii) are equivalent. (i) p does not divide N and a_p in O_lambda^x. (ii) p does not divide N and there exists an element alpha of O_lambda^x such that 1 - alpha u divides the polynomial 1 - a_p u + epsilon(p) p^{k-1} u^2. (iii) V_{F_lambda}(f) is crystalline as a representation of Gal(Qbar_p/Qp), and there exists a one dimensional F_lambda-subspace ...

  Gives the three equivalent formulations of good ordinary reduction, including the unit-root condition and the unramified line, as recorded in the hypotheses. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter IV, 17.3 and Thm. 17.4, printed p. 273.

  > Sel_infinity(T) = lim_n Sel(Q(zeta_{p^n}),T(r))(-r) (1 <= r <= k-1) which is independent of r, and let X(T) = Hom_{O_lambda}(Sel_infinity(T),F_lambda/O_lambda). ... Theorem 17.4. Assume f has good ordinary reduction at lambda. ... (1) X(T) is a torsion Lambda-module. (2) ... length_{Lambda_p}(X(T)_p) <= ord_p(L_{p-adic,alpha,omega,gamma}(f)) for any prime ideal p in Lambda of height one ...

  Gives the definition of X(T), the independence of r, and statements (1) and (2) with the exclusion of primes containing p. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter IV, Thm. 17.4(3) and 17.5, printed pp. 273-274.

  > (3) Let alpha, omega, gamma be as in (2), and assume that both omega and gamma are good for some Gal(Qbar/Q)-stable O_lambda-lattice of V_{F_lambda}(f) in the sense of 17.5 below. Assume further p not= 2 and that the condition 12.5.2 in 12.5 (4) is satisfied. ... In the case f of weight 2 and T = (TpE)(-1) for an elliptic curve E over Q, omega is good for T if and only if omega is a ...

  Gives statement (3) with the goodness hypothesis and its concrete weight-2 interpretation as the Neron differential, recorded in the hypotheses and acceptance. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter IV, Prop. 17.2, printed pp. 272-273.

  > Assume f has good ordinary reduction at lambda. ... let 0 -> T' -> T -> T'' -> 0 be the exact sequence defined by T' = T intersect V'_{F_lambda}(f), T'' = T/T'. Then for 1 <= r <= k - 1, the subgroup lim_n Sel(Q(zeta_{p^n}),T(r))(-r) ... coincides with the kernel of ... and hence is independent of r

  Gives the ordinary filtration and the independence-of-r statement recorded in the second proofStep.

#### `cm-exclusion-and-the-separate-treatment` — Why the CM case is excluded from the Euler-system argument

*lemma.*

**Statement.** If f has complex multiplication -- i.e. there is an imaginary quadratic field K and a Hecke character psi of K with L(f,s) = L(psi,s) -- then hypothesis (v) of Thm. 13.4 fails, so the Euler-system bound of Sec. 13 does not apply, and Kato's proof of the results of Sec. 12 in the CM case is completed separately in Sec. 15. Correspondingly, Ribet's theorems quoted in 12.8 supply the large-image condition (12.5.2) only for forms WITHOUT CM: if f has no CM then for almost all finite places lambda of F there is a Gal(Qbar/Q)-stable O_lambda-lattice satisfying (12.5.2), and for every lambda there is a lattice and a basis whose image contains an open subgroup of SL_2(Z_p).

**Hypotheses.**

- 'f has CM' is defined by the existence of an imaginary quadratic K and a Hecke character psi of the idele class group of K with L(f,s) = L(psi,s)
- the failure is specifically of hypothesis (v) (existence of sigma in Gal(Qbar/Q(zeta_{p^infinity})) with a one-dimensional fixed space), because the restricted image is contained in a normaliser of a torus
- 12.8.1 gives (12.5.2) only for ALMOST ALL lambda; 12.8.2 gives, for every lambda, only an OPEN SUBGROUP of SL_2(Z_p) in the image, which is weaker than containing SL_2(Z_p)

**Construction, or proof, in steps.**

1. Kato records the failure of (v) in the CM case immediately after Thm. 13.4 and defers the CM case to Sec. 15.
2. Remark 12.8 quotes Ribet's generalisation of Serre's open-image theorem for the two large-image statements 12.8.1 and 12.8.2, and notes that if (12.5.2) holds for one stable lattice then all stable lattices are scalar multiples of it, so (12.5.2) is lattice-independent.

**Acceptance.**

- Check that any application invoking Thm. 12.5(4) or Thm. 17.4(3) records either the non-CM hypothesis or a separate CM argument; conflating the two would apply a theorem whose hypothesis is known to fail.
- Check the distinction between 12.8.1 (almost all lambda, contains SL_2(Z_p)) and 12.8.2 (all lambda, contains an open subgroup): only the former gives (12.5.2).
- Check that Sec. 15 (not read in this packet) supplies the CM branch, and treat it as an unresolved reading boundary until inspected.

**Prerequisites.**

- `mathlib:IsCyclotomicExtension`

**Sources.**

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, after Thm. 13.4, printed p. 226.

  > However if f has CM, this theorem is not applied because the condition (v) is not satisfied in the CM case. So the CM case will be discussed separately in Sec. 15.

  States the exclusion and the location of the replacement argument verbatim.

- kato-2004-asterisque-295 — Kazuya Kato, *p-adic Hodge theory and values of zeta functions of modular forms*, Chapter III, Remark 12.8 and (12.8.1), (12.8.2), printed pp. 222-223.

  > We say that f has complex multiplication (f has CM) if there is an imaginary quadratic field K of Q and a Hecke character psi of K ... such that L(f,s) = L(psi,s). ... (12.8.1) If f has no CM, then, for almost all finite places lambda of F, there exist a Gal(Qbar/Q)-stable O_lambda-lattice T of V_{F_lambda}(f) which satisfies the condition (12.5.2) at Thm 12.5 (4). ... (12.8.2) If f has ...

  Gives the definition of CM and the two distinct large-image statements, with 'almost all lambda' in the first and 'open subgroup' in the second, as recorded in the hypotheses. The excerpt is truncated to keep it short; the full quotation is in data/decompositions/KatoEulerSystems.json, where the independent review checked it.

---

## Gaps

Each of these is something this packet could not establish from the sources read. None is papered over,
and no node depends on one without naming it.

### The generalised explicit reciprocity law of [KK3] is unread

Kato Sec. 10 opens by stating that Thm. 9.5 is DEDUCED from a generalised explicit reciprocity law proved in [KK3] (K. Kato, 'Generalized explicit reciprocity laws', Adv. Stud. Contemp. Math. 1 (1999), 57-126), together with the compatibility (10.9.5) proved in his Sec. 11. Verified: the statement of Thm. 9.5 with all its hypotheses, and that it is an import. Not verified: the statement or proof of the [KK3] reciprocity law, the theory of B_dR over non-perfect residue fields used to formulate it, and the compatibility (10.9.5). Next source action: locate [KK3]. It is not present in the supplied library: CATALOGUE.json contains no record whose title matches 'Generalized explicit reciprocity laws'. The catalogue claim in this gap was CORRECTED IN REVIEW, however: besides the Asterisque 295 paper, the log-structures paper and the Hyodo-Kato paper, the catalogue does hold two neighbouring records that a reader will want to know about -- KLZ_RankinEisenstein, Kings-Loeffler-Zerbes, 'Rankin-Eisenstein classes and explicit reciprocity laws' (references/papers/KI_KLZ_RankinEisenstein.pdf, sha256 2530d973..., downloaded but with NO text extraction), and HuberKings_PadicBorel, 'A p-adic analogue of the Borel regulator and the Bloch-Kato exponential map' (downloaded, also unextracted). Neither is [KK3], but the KLZ paper proves explicit reciprocity laws of the same family and is the natural substitute source if [KK3] cannot be obtained. Failing that, read Kato Sec. 10-11 in full, which reduce Thm. 9.5 to a statement of [KK3] that can at least be recorded precisely.

### Kato Thm. 13.4 versus Rubin Thm. II.3.3: the hypothesis packages are not literally the same

Verified by reading both statements: Kato 13.4 assumes (iv) 'T tensor L is irreducible as a representation of Gal(Qbar/Q) over L' together with (v) 'there is sigma in Gal(Qbar/Q(zeta_{p^infinity})) with dim_L Ker(1-sigma; T tensor L) = 1', and concludes a length bound on H^2(T)_0 = Ker(H^2(T) -> H^2_loc(T)) by the ideal J. Rubin Thm. II.3.3 (draft p. 28) assumes Hyp(K_infinity,T), whose irreducibility clause is over G_{K_infinity} = Gal(Qbar/Q(zeta_{p^infinity})) and whose tau-clause requires T/(tau-1)T FREE OF RANK ONE OVER O (an integral condition), plus Hyp(K_infinity/K) -- which is automatic here, since Rubin states it 'is satisfied if K = Q' and Kato works over Q, so this half of the mismatch is harmless; it concludes char(X_infinity) divides ind_Lambda(c) with X_infinity = Hom_O(S_{Sigma_p}(K_infinity,W^*),D). Not verified: (a) that Kato's (iii)+(iv) imply irreducibility over G_{K_infinity}; (b) that Kato's H^2(T)_0 and Rubin's X_infinity agree (this should be a Poitou-Tate computation but was not carried out); (c) that ind_Lambda(c) and Kato's J coincide. Next source action: read Rubin Chapter VII Sec. 1 ('Outline') and Sec. 4 ('Proof of Theorem II.3.2'), and Rubin Chapter I Sec. 7 (global duality), both present in the supplied draft; then read Perrin-Riou [Pe4] for Kato's exact formulation.

### The archimedean zeta-value input (Kato Sec. 4-7, Thm. 2.6 and Thm. 6.6) is unread

Verified: the statements of Thm. 2.6 (Beilinson regulator formula, hypothesis prime(M) in prime(N)) and the role of Thm. 6.6 in the proof of Prop. 13.7. Not verified: the construction of the zeta elements in the spaces of modular forms (Sec. 4), the elements on X_1(N) tensor Q(zeta_m) (Sec. 5), the projection to eigen cusp forms (Sec. 6), Thm. 6.6 itself, and Kato's proof of Thm. 2.6 in Sec. 7. Without these the identification of exp^* of the p-adic class with a complex L-value is only half-sourced: the p-adic half (Thm. 9.7) has been read, the archimedean half has not. Next source action: read Kato Sec. 4 (4.1-4.5 and Prop. 4.4, which is the stated input to Thm. 9.6), Sec. 6.6, and Sec. 7.17 in the same digitisation.

### Thm. 12.5(1): the constant is now transcribed, but per_f and the dual form f^* are not sourced

CORRECTED IN REVIEW. The display is illegible in the Numdam TEXT LAYER but perfectly legible in the PDF itself: a rendering of printed p. 221 gives the interpolation value as (2 pi i)^{k-r-1} . L_{{p}}(f^*, chi, r) . gamma^{pm}, with the twisted period map landing in V_C(f)^{pm}, the sign rule pm = (-1)^{k-r-1} chi(-1), and gamma taken in V_F(f). That correction matters twice over: the L-function is that of the DUAL form f^*, which this packet had recorded as f, and the constant is no longer an untranscribed acceptance item. What remains NOT verified: the definition of per_f (Kato's table of special notation) and the definition of f^* and of V_C(f)^{pm}, none of which was read; these are what fix the period normalisation the L3 stage text demands. Next source action: read Kato's notation table and 6.3 (the definition of S(f) and per_f) in the same digitisation, rendering the pages rather than relying on the text layer.

### Sections 14-16 (finiteness, CM case, construction of the p-adic zeta function) are unread

Verified: that Sec. 15 is Kato's replacement argument for the CM case, and that Thm. 17.4(2),(3) quantify the bound by ord_p of a p-adic zeta function constructed in Sec. 16. Not verified: any content of Sec. 14, 15 or 16. In particular the object L_{p-adic,alpha,omega,gamma}(f) appearing on the right of Thm. 17.4 is, in this packet, an unexamined input; its interpolation property and its dependence on (alpha,omega,gamma) have NOT been checked against the analytic p-adic L-function owned by ModularSymbolsPadicLFunctions. Next source action: read Kato Sec. 16.1-16.6 and Sec. 17.6-17.10 in the same digitisation before proposing any edge between KatoEulerSystems L3/L4 and ModularSymbolsPadicLFunctions.

### Candidate local formalisation primitives were not searched

Implementation status for every node in this packet is 'unchecked' and no Lean library was searched for this packet. The instruction permits noting candidate primitives from a local mathlib/TauCeti checkout; that search was not performed here, so the correct record is UNCHECKED rather than 'absent'. Next action if wanted: grep the TauCeti and mathlib checkouts for 'Siegel', 'thetaFunction', 'ModularCurve', 'K2' and 'EulerSystem' and record hits as candidates only.

### Hypothesis (v) of Kato Thm. 13.4 is never verified for non-CM forms in the sections read

Found in review. Kato's Thm. 13.4 has five hypotheses. Immediately after stating it he records that '(ii), (iii), (iv) in Thm. 13.4 are satisfied' in the situation of 13.3, citing Deligne and Ribet, and that '(v) is not satisfied in the CM case'. He does NOT, in Sec. 12 or Sec. 13, say where (v) is verified when f has no CM. Verified: the text of the passage and of Remark 12.8's two large-image statements (12.8.1) for almost all lambda and (12.8.2) for all lambda with an open subgroup of SL_2(Z_p). NOT verified: that (12.8.1) or (12.8.2) yields an element sigma of Gal(Qbar/Q(zeta_{p^infinity})) with dim_L Ker(1 - sigma) = 1. The implication is believable but it is an inference, and the packet previously recorded it as if Kato had made it. Next source action: read Kato Sec. 14.7 (which the text cross-references for the lattice argument) and Sec. 15, and check whether (v) is discharged there or is meant to follow from (12.8.2).

### The displayed formulas of the source were not re-verified in this session

Both sources of this roadmap are freely available and both were re-downloaded for this packet; their SHA-256 hashes reproduce the recorded ones byte for byte, which is recorded in the source entries. The prose of Theorems 12.4, 12.5(1), 13.6 and 13.5(2) and of Proposition 13.7 was re-read directly and agrees with what the integrated decomposition records. The displayed formulas, however, are garbled in the Numdam text layer, exactly as the independent review of the decomposition recorded when it read those pages from page renderings instead; no page-rendering tool was available in this session. Every displayed formula in this packet therefore rests on that review's reading, not on a reading made here, and a reviewer should treat the two differently.

## Structural proposals

Recorded in the packet's `restructure` list. This packet works with the current structure.

### L4 mixes an imported machine with the theorems it yields (`split-layer`)

L4 contains the imported Euler-system bound, which the source does not prove and which this packet requests from EulerSystemsAndKolyvaginSystems:ES.8, together with the three results that follow from it: the nonvanishing of the zeta submodule, one divisibility in the cohomological main conjecture and the good-ordinary Selmer divisibility. The imported bound has a different acceptance test from the rest - it is checked against the hypothesis package of the supplier, and the integrated decomposition records that the source's package and Rubin's are not literally the same - while the three consequences are checked against the source's own proofs. Dividing the layer would make that boundary visible in the atlas and would stop the imported theorem appearing to be part of what this roadmap proves.

## Checks

    python3 scripts/check_blueprint.py research/blueprint/packets/KatoEulerSystems.json

Zero errors and zero warnings against the pinned declaration index.
