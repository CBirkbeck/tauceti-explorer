# Independent package review: SpecialValuesBirchTate

Reviewer: Codex, session `codex-AsWvRA`, 2026-10-20. Job: `REV-PKG-SpecialValuesBirchTate~codex2`, issue #11374.

**Verdict: needs_changes.** This is a completed independent review, not a checkpoint or an acceptance of the preceding fix worker's self-review. The five earlier findings have substantial, independently checked repairs at proof-plan level. Four prerequisite/order defects remain below. No construction is claimed formalised. The end theorem still concerns **every totally real number field, with no prime excluded**. General higher-weight, S-integral and equivariant targets remain present.

The issue's embedded template calls this a Lawrence–Venkatesh roadmap and names a nonexistent earlier `~codex` report. I reviewed the actual SpecialValuesBirchTate package and its 54-node accepted input, the existing [earlier independent report](REV-PKG-SpecialValuesBirchTate~adv.md), and [fix handoff](../handoff/FIX-PKG-SpecialValuesBirchTate~adv.md). I did not author those inputs. The claim bot confirmed this session before work began.

## Remaining findings and exact restart

### F1. The supplied proof of rationality still has a missing premise

Package §§2.5 and 8.2 consume **BorelRegulators §7.2**, not merely its analytic §§5.1–5.4. I corrected those citations. In the current Borel package, the proof goes through §§6.2–6.4 and 7.1: the norm-one multiplicative-group adelic volume in the normalization of AdelicAlgebraicGroups §2.4 is missing. That package's current review explicitly retains this gap. Compactness of the norm-one quotient and the arithmetic Dedekind-zeta residue do not identify its measure or prove its volume.

Consequences here: §2.5's proof that the nonzero even-weight values over totally real fields are rational, the rational-valuation reconstruction using that proof, and §8.2's nonzero rational regulator quotient are not closed by the cited supplier. This does not dispute Klingen–Siegel rationality or the numerical Birch–Tate theorem. Kolster 2009, Lecture 2 §4, p. 16 states the former, but a source statement alone is not the proposed prerequisite decomposition.

**Required repair:** obtain a permitted, ordered proof of this rationality input (and the more general regulator quotient where used), or resolve the supplier's missing premise through a maintainer ownership decision. I have not assigned a norm-one volume theorem here or to another owner, and have not added a theorem of Tate's thesis. The package's Scope now identifies the gap. LFunctions remains the owner of the continued zeta function and functional equation.

### F2. The all-weight comparison uses a supplier with an unresolved algebraic input

Package §§8.1–8.5 use MotivicEtaleKTheory §§10–11. That roadmap's current independent review and its “Required quadratic and geometric extensions” contract identify an absent **algebraic Pfister-symbol comparison**, used in §6.4's dyadic norm-variety argument before norm residue. The needed export identifies isometry of all-length Pfister forms with equality of pure Milnor symbols modulo two, naturally under extensions, independently of norm residue. The cohomological zero criterion in QuadraticFormInvariantsPartII Q2.3 depends on norm residue and cannot prove this prerequisite without a cycle.

**Required repair:** supply that independent algebraic comparison in its proper earlier owner, then propagate the resulting norm-residue/Beilinson–Lichtenbaum/Quillen–Lichtenbaum chain. The present package cannot implement a different roadmap's missing proof. The Scope now marks this dependency. Weight two uses the earlier Tate K₂ comparison in MotivicEtaleKTheory §3; I do **not** attribute this all-weight gap to that independent degree-two route. I also did not count the supplier's separate geometric logarithmic Deligne gap as automatically blocking the early number-field point regulator in §12.3.

### F3. The regulator contract promises a stronger integral comparison than is supplied

In §8.2 the power-of-two ratio between the normalized Borel and motivic covolumes requires an **integral lattice comparison compatible with the normalized regulator**. MotivicEtaleKTheory §12.3 constructs an integral-image candidate; its §12.8 proves a conditional formula, with additional integrality and finite-index premises:

```text
R_ch / R_M = e / ((n − 1)!)^r.
```

It neither proves those lattice premises in the needed generality nor proves that the quotient displayed has zero valuation at every odd prime. Rational comparison, abstract isomorphism up to two-torsion, and equality of abstract p-adic group orders do not by themselves compare the images of the specified regulator lattices. Kolster 2009 p. 11 describes the group comparison; p. 16 states the regulator comparison but does not supply the missing normalized integral-index proof here.

For a negative control on the inference, abstract rank-one lattice data with n=3 and e=3 satisfy the supplier's conditional formula with ratio 3/2, which is not a power of two. This is a logical test of the advertised interface, not an arithmetic counterexample. In rank zero the covolumes are one, so this finding does not invalidate the numerical rank-zero Birch–Tate comparison.

**Required repair:** prove a normalized regulator-compatible finite-two-primary lattice comparison, or give the integral full-rank premises and prove the odd valuations of `e/((n−1)!)^r` vanish. I changed §8.2 from treating this as an existing supplier export to naming it as an additional required target, and marked it in Scope. No general number-field regulator target was removed.

### F4. “Ordered before this roadmap” cannot be certified

`upstream/CaraianiNewton.md` orders 88 retained roadmaps in the Caraiani–Newton programme. SpecialValuesBirchTate and much of its K-theory family have no tier or bundle there. Their presence in `focus.json` supplies priority, not a dependency order. The same defect was recorded in the current independent MotivicEtaleKTheory review.

Moreover that order file explicitly drops AutomorphicPadicLFunctions and moves its L3 ordinary totally-real input down toward PadicFamilies. This package still consumes its Deligne–Ribet interpolation/integrality in §§2.8 and 6.1. A citation to the old owner cannot certify an earlier supplier under the issue's order rule. I checked the actual mathematical contract rather than silently replacing this citation by a different roadmap whose required all-field/all-prime export is not established.

**Required repair:** the maintainer must assign the arithmetic K-theory family's upstream order/bundles and reconcile the Deligne–Ribet owner with that order. Then route the full contract to the actual earlier owner. There is no invented tier in this review. I found no direct return dependency on SpecialValuesBirchTate in the concrete input chains checked; that does not certify a missing global order. `RankZeroOneBSD` supplies nothing here. PeriodsAndSpecialValues is used only for PS.3–PS.5, not its BSD layer.

## Earlier five findings: independent verification

“Closed” in this table concerns the particular earlier defect at roadmap level; it does not certify all suppliers globally or override F1–F4.

| Earlier finding | Material read and adversarial check | Result |
|---|---|---|
| Independent upper bound for K₂(ℤ) | K2SymbolsBrauer §§6.10–6.13 and 12.1–12.10: finite-rank monomial relations, exceptional rank-two relation, lexicographic peak reduction, last-column kernel and stable upper bound. The real sign gives the independent lower bound. The result is independently stated in K-book III.5.2.2, p. 218 and III.6.2.1, p. 232. | Closed as a proof plan. No circular inference from ζ(−1). Original Milnor book not independently consulted; see source-access note. |
| Independent golden-field tame kernel | ArithmeticKTheory §§8.3–8.9: direct work over ℚ(√5), four strict stretched-ball cutoffs, finite congruence-lattice certificates, all norm-≤33 primes and independent real signs. Recomputed every displayed relation and selected determinant, as detailed below. | Closed as a proof plan; no obsolete generalized-Thue or cyclotomic-extension shortcut. |
| Classical/modern p=2 dictionary | IntegralIwasawaTheory §§2.8, 10.6 and 12.4: ordinary Kummer sequence, uniform real-unit capitulation, two exact module sequences and both finite-specialization six-term sequences. Checked covariant dual action, involution, finite kernels/cokernels and Tor terms. | Closed as a proof plan. Neither a pseudo-isomorphism nor a blanket μ=0 assumption replaces the finite calculations. |
| Ordinary-real Burns–Flach complex | IntegralIwasawaTheory §§10.1–10.3 and this package's exact contract. Read original Burns–Flach 1996 Proposition 1.20, pp. 78–80, with p. 86 and the preceding comparison on pp. 73, 77. The bounded/perfect object is the global ordinary-all-places cone, with the high real tails cancelled globally. | Closed as a proof plan. Degree-zero norm two, derived base change and the order-two Selmer correction remain; individual real Tate pieces are not simply truncated. |
| Independent μ-vanishing | IntegralIwasawaTheory §§5.1–5.5. Read Sinnott 1984 pp. 275–282, Washington 1978 p. 88 and Oesterlé 1979 §4, pp. 173–174. Checked analytic Γ-transform input and norm-minus class-growth argument separately. | Closed by the explicit alternative Sinnott route. At p=2 the integral numerator is P₂/2; the argument does not assume full plus-part dyadic reflection or deduce μ=0 from the main conjecture it is proving. |

### Recomputed golden-field certificate

The calculation used exact rational/integer arithmetic in the basis 1, ε with ε²=ε+1, implementing inversion by conjugation and norm. The README data were parsed as data. For each of **173** triples, it checked integrality and the exact identity `g^A − g^B = π g^C`; it independently expanded **23** selected maximal minors. It also checked that the proposed residue generators generate `(O/(π))×`, that the determinant gcd is q−1, and that the list exhausts primes of norm ≤33 using the quadratic splitting law. No fetched program was executed.

| π=a+bε | q | Relations | Selected signed maximal minors | gcd |
|---|---:|---:|---|---:|
| 2 | 4 | 4 | 6, −3 | 3 |
| −1+2ε | 5 | 3 | 4 | 4 |
| 3 | 9 | 4 | 8 | 8 |
| 3+ε | 11 | 15 | 60, −30, −10 | 10 |
| 4−ε | 11 | 12 | 70, −20 | 10 |
| 4+ε | 19 | 14 | −54, −36 | 18 |
| 5−ε | 19 | 16 | 216, −18 | 18 |
| 5+ε | 29 | 27 | −168, −224, 420 | 28 |
| 6−ε | 29 | 20 | 56, 28 | 28 |
| 5+2ε | 31 | 22 | 90, 60 | 30 |
| 7−2ε | 31 | 36 | −180, −240, −90 | 30 |

Groenewegen, Lemma 7, pp. 1448–1449, Proposition 10, pp. 1450–1451, and Lemma 12/Proposition 13, p. 1453 provide the general tame-kernel reduction and relation-lattice mechanisms. The special norm-33 refinement is ArithmeticKTheory's own certificate; it is not asserted to be Groenewegen's general numerical bound. In the stretched-ball step, a common ξ is required for each pair of representatives, but may vary between pairs. This distinction resolves a potential objection to the cutoff argument. Sources establish the framework; the independent calculation above checks the actual finite data.

## Corrections made in this package

- Replaced obsolete supplier stage identifiers and packet filenames by the actual roadmap sections, including the K₂ finite-rank chain, ArithmeticKTheory's norm-33 chain, IntegralIwasawaTheory's current comparison sections, its going-up §§12.1–12.3, and GeneralAlgebraicKTheory §§4.15–4.17 for relative K₀. Retained actual named layers where those are the supplier's section headings.
- Corrected Borel rationality references to §7.2, separated the unproved integral lattice contract from the conditional formula actually supplied, and added the three mathematical missing prerequisites to Scope.
- Removed the Cohen book mirror citation. Rationality uses the explicit Borel chain and Kolster's public statement; χ₅'s evaluation uses native quadratic-character/Hurwitz APIs and the LFunctions factorization. No original passage was copied into the package.
- Corrected downstream prose: the arithmetic suppliers do not depend on their own special-value application to construct the independent certificates. Downstream applications are EllipticRegulators, EllipticKTheory and Polylogs.
- Rewrote Suggested.lean to the binding compact shape: two real-bodied definitions, twelve milestone statements and four proved examples, exactly two per definition. Removed auxiliary API theorem development and unrelated numeric/library examples. All removed mathematical API and test content remains in the README. The character tests now prove values directly from Mathlib, independently of the admitted L-value theorem. The Euler tests likewise do not invoke a local admitted theorem.
- Updated the prose that described the former Lean examples. No target, field, prime or higher-weight generality was removed. `metadata.toml` remains the appropriate single line `topic = "math.NT"`.

## Fidelity: all 54 accepted targets

The following uses the input's array positions only as an audit index; it is not a new target catalogue in the roadmap. A boundary means the original mathematical target is consumed from its owner, not replanned. Additional rationality/integrality, naturality and real-place targets already in the accepted input remain present.

| Input positions and target family | Package location / ownership boundary |
|---|---|
| 1 formula; 2 multiplicative equivalence; 3 nonzero consequence | §§1.1–1.2 |
| 4 gamma values; 5 real positivity | §§2.1–2.2; §2.2 adds ≥1 to current library positivity |
| 6 reciprocal-gamma continuation | Scope boundary: LFunctions and BorelRegulators §§5.1–5.4; §2.3 only specializes the order |
| 7 sign; 8 failure with a complex place | §§2.4 and 2.3 |
| 9 rational valuations; 10 absolute form; 11 primewise form; 12 denominator consequence | §§2.6–2.7 and 2.9 |
| 13 rational-field comparison; 14 ζℚ(−1); 15 K₂(ℤ); 16 rational example | Scope boundaries LFunctions Layers 1/8 and K2SymbolsBrauer §12.10; application §3.1 |
| 17 golden ideal count; 18 golden factorization | Scope boundary LFunctions Layer 4; only evaluation in §3.2 |
| 19 golden zeta value; 20 golden w₂; 21 golden Birch–Tate check | §3.2; w₂ input from ArithmeticKTheory §§4.1–4.4; independent K₂ certificate §§8.3–8.9 there |
| 22 S-modified zeta; 23 Euler factors; 24 K₂(S) order; 25 S-integral formula | §§4.1–4.4 |
| 26 Federer; 27 tame two-part; 28 invariants; 29 implication | §§6.1–6.4 |
| 30 abelian Federer; 31 abelian two-part; 32 abelian formula | §§6.5–6.6 |
| 33 invert ℓ; 34 K₂/étale; 35 w₂/H¹ | §4.3; Scope boundaries ArithmeticKTheory §§6.1–6.5 and MotivicEtaleKTheory §§2.1–3.5, consumed in §§5.2–5.3 |
| 36 étale Euler characteristic; 37 odd-primary formula; 41 all even-weight odd-primary Euler characteristic | §§5.2–5.3 |
| 38 H² model; 39 h-primary valuation; 40 Lichtenbaum predicates; 42 odd Lichtenbaum | §§8.1–8.3 |
| 43 Kurihara/Kolster series; 44 Kurihara theorem; 45 comparison; 46 all-field Federer; 47 all-field Birch–Tate | §§7.1–7.5; main-conjecture input IntegralIwasawaTheory §11.7 |
| 48 rationality; 49 independent integrality | §§2.5 and 2.8, with F1 and F4 recorded |
| 50 enlarging S; 51 localization naturality | §§4.5–4.6 |
| 52 real two-correction; 53 higher abelian values; 54 equivariant Tate predicate | §§8.4–8.6; §8.5 also retains the stronger all-totally-real target |

## Adversarial mathematical pass

I checked every numbered subsection, its subsidiary identities/API and its Checks. Entries group statements sharing the same hypotheses; they do not exempt the subsidiary formulas. “Retained” describes the statement and local deduction, subject to F1–F4 for prerequisite closure.

| Statements/definitions/conventions checked | Instances and failure modes tried | Outcome/change |
|---|---|---|
| Standing F, S, cardinalities, twists, ζ and ζ* | ℚ, imaginary quadratic, empty S; infinite-group `Nat.card=0`; weight 0; raw L-series at −1; totalized gamma at a pole | Finiteness and n≥2 are explicit; only the continued function is evaluated at negative integers. Retained. |
| §1.1 BirchTateFormula | ℚ gives −1/12; ℚ(√5) gives 1/30; a complex place gives zero zeta against a positive finite quotient | Signed quotient and total-reality distinctions retained. |
| §1.2 multiplicative form/nonzero/integrality | w₂>0, K₂ finite and positive order; do not cancel zero; distinguish independent integrality from a consequence of the formula | Retained. |
| §2.1 gamma identities | k=1 gives Γℝ(−1)=−2π and Γℝ(2)=1/π; k=0 is excluded; Γℝ(−2)=0 is not a usable meromorphic value | Retained; Lean hypotheses agree. |
| §2.2 real half-line lower bound | σ>1; unit ideal contributes 1; σ=1 excluded | Kept stronger ≥1 variant; current library positivity only a boundary. |
| §2.3 vanishing and complex-place nonexample | n even: order r₂; n odd≥3: order r₁+r₂>0; imaginary quadratic n=2 | Retained; zero rather than the erroneous “pole” wording in K-book VI.8.6. |
| §2.4 sign and functional-equation specialization | ℚ at n=2 has negative sign, degree-two real field positive; k=1 coefficient −|d|^(3/2)/(2π²) per real factor | Retained with nonzero gamma/discriminant and positive ζ(n). |
| §2.5 rational q | Rank-zero covolume 1; uniqueness uses ℚ→ℂ injectivity; nonzero value comes from sign | Corrected rationality input to Borel §7.2; F1. |
| §2.6 valuation reconstruction | q,r>0; q and −q have identical valuations; zero uses totalized valuations | Positivity/nonzero hypotheses retained. |
| §2.7 absolute/primewise equivalence | ℚ: 2/24=1/12; negative value requires absolute value; primes including 2 | Retained, integer-valued valuation identity. |
| §2.8 independent denominator integrality | Even n≥2; p=2 as well as odd p; smoothing ideal prime to p; auxiliary factors at v∣p are p-units; cyclotomic image detects minimal valuation | Retained; actual Deligne–Ribet supplier must be routed as F4 requires. |
| §2.9 denominator from formula | ℚ denominator 12 divides 24 but is not 24; reduced denominator, no equality claim | Retained. |
| §3.1 rational example | ζ(−1)=−1/12, w₂=24, K₂ order 2 independently | Retained; no circular arithmetic certificate. |
| §3.2 χ₅ and golden example | Values at 0,1,2,−1; even parity; L(−1)=−2/5; product 1/30; w₂=120 not roots-of-unity order 2; K₂ order 4 independently | Retained; direct character checks proved in Lean. |
| §4.1 sEulerFactor/sModifiedZeta | S=∅ gives 1 and ζ; singleton at −1 gives 1−Nv; n=1 and nonempty S gives zero; arbitrary finite S | Retained entire factor, deletion not inversion; zero control proved in Lean. |
| §4.2 negative values/leading coefficients | n≥2 ensures each factor nonzero; at −1 each is negative; complex place requires leading coefficient | Retained. |
| §4.3 localization order and invert ℓ | Finite residue field has K₂=0; residue-unit order Nv−1; v∣ℓ gives ℓ-unit Nv−1; empty S | Exact sequence yields product; no unjustified splitting needed. |
| §4.4 S-integral formula | ℚ deleting 2 gives +1/12 while order remains 2; empty S recovers original | Retained sign (−1)^(degree+card S). |
| §4.5 enlargement equivalence | S⊆S′; only S′\S contributes; cancellation factors positive integers Nv−1 | Retained. |
| §4.6 naturality | S⊆S′; ring localization map versus cohomological restriction; finite, adic, motivic and K-theory connecting maps | Retained map domains and commuting squares; do not invert a non-isomorphism. |
| §5.1 codescent | Extension degree prime to ℓ; norm/restriction composition is degree, a unit; degree divisible by ℓ would fail | Retained general prime-to-ℓ hypothesis. |
| §5.2 odd Euler characteristics | Even n≥2, every odd ℓ; nontrivial coefficient degree dχ; torsion H¹ not free rank; H⁰ correction | Retained integral valuations; no application of odd theorem at 2. |
| §5.3 odd Birch–Tate | Weight two; ℓ inverted changes order by an ℓ-unit; w₂-primary identification | Retained; independent Tate degree-two comparison distinguished from all-weight input. |
| §6.1 series and Federer predicate | Covariant dual versus contragredient; G₂ meromorphic versus P₂ pole-cleared; p=2 coefficient content | Retained factor P₂/2, no unauthorized unit rescaling by 2. |
| §6.2 Kolster sequence | Real unit radical of rank d; norm-minus at 2 is not a ± eigenspace; finite errors retained | Retained via supplier's exact sequences. |
| §6.3 invariant order | Finite invariant group, absence of finite Λ-submodule, evaluation nonzero; torsion twist substitution u^(−1)(1+T)−1 | Retained; no interchange of action conventions. |
| §6.4 Federer implication | Auxiliary field, both kinds of character and shifted coordinate; degree/unit and denominator factors | Retained conditional proof before theorem is supplied. |
| §6.5 abelian Federer | Conductor with 2-part, odd-conductor base, Greither χ=ω exception, arithmetic norm-minus μ versus analytic μ | Retained all-prime route, including exceptional characteristic ideal (1). |
| §6.6 abelian Birch–Tate | Combine odd and two-primary identities, restore sign only after absolute value | Retained; not substituted for the all-field end theorem. |
| §7.1 determinant theorem at p=2 | Every totally real F; ordinary all-real complex; norm-two term in degree zero; Selmer injection has order-two cokernel | Retained globally bounded/perfect model and derived Tor, not truncation of separate real complexes. |
| §7.2 even-weight two-adic values | n=2 and n=4; S₂ Euler factors units; H¹ torsion and finiteness; positive/negative powers of twist | Retained, all p=2 corrections included. |
| §7.3 two-part Birch–Tate | n=2; compare exact étale H² with K₂ and H¹ with w₂ | Retained, no prime excluded. |
| §7.4 all-field theorem | Arbitrary totally real F, not assumed Galois or abelian; valuation at every prime plus rationality and sign | Retained full statement; rationality proof closure is F1. |
| §7.5 series dictionary/comparison | g versus G₂ versus P₂; covariant dual/involution; finite module specialization and Tor; two finite Euler-characteristic sequences | Retained finite corrections, including units and order-two Selmer cokernel. |
| §8.1 hInvariant | Product over all primary orders, almost all 1; n=2 gives #K₂; no infinite product of undefined group cardinalities | Retained explicit finite-support/finite-group input; all-weight supplier gap F2. |
| §8.2 regulators and Lichtenbaum predicates | Rank zero covolume 1; n=3 rank one and finite index e=3; factorial scaling; raw value zero versus leading term | Replaced unsupported integral export by required target; F1 and F3. General number-field conjectures remain conjectures. |
| §8.3 odd Lichtenbaum/cohomological all-even formula | n=2 recovers Birch–Tate; every even n, rank r₂=0 for totally real F; ℓ=2 supplied separately | Retained; all-weight comparison prerequisite F2. |
| §8.4 real-place correction | d=r₁=1 for ℚ; n mod 4 distinguishes extension; valuation includes d; do not identify corrected K-groups with ordinary étale groups individually | Retained all rows/correction, not odd-prime shortcut. |
| §8.5 higher values | n=2, degree-one test; n even≥2; finite odd K-group, sign (−1)^((n/2)r₁), factor 2^r₁; abelian going-up route separately | Retained stronger all-field target and classical abelian proof. |
| §8.6 ETNCData/rationality/predicate | Trivial G, noncommutative G, changed projective lattice, local p versus global class; rationality required before local test | Retained plus sign, center-valued leading term and extended reduced-norm boundary; finite-quotient correction, not invariance of an uncorrected integral section. General ETNC not asserted proved. |

## Definitions, APIs and checks

Every owned definition has named API and at least three discriminating prose checks. The two light definitions are also tested by four proved Lean examples. Heavy definitions are explicitly listed in the closing comment rather than encoded using admitted data.

| Definition | Discriminating checks checked (in addition to its named API) |
|---|---|
| BirchTateFormula | ℚ, ℚ(√5), failure with a complex place |
| rational representative q in §2.5 | Equality with the continued value, nonzero signed value, uniqueness rather than an arbitrary rational approximation |
| chiFive | Zero/nonresidues, 1 and even parity, agreement with quadratic/Hurwitz evaluation |
| sEulerFactor | Empty set, singleton deletion, zero at n=1; nonzero only for n≥2 |
| sModifiedZeta | Empty set, ℚ deleting 2, a vanishing value versus its leading coefficient |
| two-adic series definitions | Meromorphic function versus numerator, shift of generator, dyadic factor 1/2 |
| FedererMainConjecture | Equality of ideals up to units, correct covariant twist, distinguished-series normalization |
| hInvariant | Weight two, primary valuations, finite support |
| motivicRegulatorCovolume | Rank zero, change of integral basis, finite-index lattice versus rational span |
| LichtenbaumFormulaOddPart | Weight two, exclusion of false exact two-part assertion, sign/leading coefficient |
| MotivicLichtenbaumFormula | Rank-zero specialization, torsion denominator, regulator basis invariance |
| TateMotiveETNCData | Coherence and analytic inputs, changed projective structure, noncommutative coefficient algebra |
| TateMotiveETNCRationality | Rational-class membership, local comparison only after rationality, distinction from integral vanishing |
| TateMotiveETNC | Class zero, corrected lattice independence, local criterion with rationality and noncommutative boundary |

## Source verification

I opened public originals, reading the actual cited statements and the delicate comparison passages, not search snippets. Scan-only formulas in Burns–Flach 1996, Sinnott, Washington and Oesterlé were read as page images. Citations below use printed pages. This report and package contain results in my own words, not source excerpts or a section-by-section synopsis.

| Public source | Passages verified / use |
|---|---|
| [Weibel, K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | III.5.2.2 p.218, III.6.2.1 p.232; IV.1.13 p.269; V.6.8 p.412; V.11.11–11.13 pp.457–459; VI.8.6–8.8 pp.514–516 and VI.9.4–9.5 pp.519–520. Arithmetic statements, ranks, regulator and real-two conventions. |
| [Kolster, 2009 lectures](https://maine-quebec.mat.ulaval.ca/09/Kolster09.pdf) | pp.8–16, especially K₂(S) p.8, twisted groups pp.9–11, Iwasawa comparison pp.13–15, rationality and normalization p.16. The rank sentence on p.11 must be read with the parity ranks on pp.10,15; the package has r₂ for even weight and r₁+r₂ for odd. |
| [Kolster 1989](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BBA978AE0673CACCF3656F4E23200201/S0008439500000862a.pdf/a-relation-between-the-2-primary-parts-of-the-main-conjecture-and-the-birch-tate-conjecture.pdf) | Entire pp.248–251, especially Theorem 1 and Lemma 2 p.249, Theorem 5 p.250. Exact twist and characteristic-series conventions. |
| [Greither 1992](https://www.numdam.org/item/AIF_1992__42_3_449_0.pdf) | §1 pp.451–454; Theorem 3.2, Lemma 3.3 and Proposition 3.4 pp.469–470, including χ=ω. |
| [Kurihara 2025](https://kurihara.math.keio.ac.jp/ClassGroupsIwasawaModules.pdf) | §4 pp.22–27, especially Theorem 4.1 p.24, Theorem 4.2 p.25, Selmer comparison p.26 and height-one argument p.27. All totally real bases and p=2 retained. |
| [Rognes–Weibel](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf) | Theorems 0.1–0.3 and 0.6 pp.1–4; Appendix A.1–A.4 pp.45–49. Real-place rows and abelian going-up. |
| [Burns–Flach 1996](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0305/LOG_0010.pdf) | (1.9) p.73, (1.18) p.77, Proposition 1.20 pp.78–80 and p.86: ordinary-real compact supports and Selmer comparison. |
| [Burns–Flach 2001](https://ems.press/content/serial-article-files/25892?nt=1) | Lemmas 5–6 pp.526–529; Lemma 9 pp.534–535; Conjectures 4–6 and Remark 9 pp.535–537. Corrected relative K₀ class and rational/local conditions. |
| [Sinnott 1984](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0075/LOG_0020.pdf) | pp.275–282, Theorem 1 pp.276–277 and Proposition 4.1 with its calculation pp.279–282: Γ-transform and dyadic integral coefficient normalization. |
| [Washington 1978](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0049/LOG_0007.pdf) | p.88 relative class-number expression; subsequent odd-prime arguments not imported as a dyadic reflection theorem. |
| [Oesterlé 1979](https://www.numdam.org/article/SB_1978-1979__21__170_0.pdf) | §4 pp.173–174, including q=4 at p=2, first-kind reduction and relative class-number growth. |
| [Bass–Tate 1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf) | II §3, Lemma 3.2, pp.404–407 and Appendix Proposition 1 pp.429–431. Finite generation and tame reduction framework, not a numerical Birch–Tate computation. |
| [Groenewegen 2004](https://scispace.com/pdf/bounds-for-computing-the-tame-kernel-4jcvx5pki0.pdf) | Lemma 7 pp.1448–1449; Proposition 10 pp.1450–1451; Lemma 12/Proposition 13 p.1453; Theorems 14–15 pp.1454–1455. Distinction between general bound and the supplier's smaller explicit certificate. |

The private-library clearance index was checked before accessing books. Cohen II and Milnor were not cleared there; I did not obtain or read another copy of either. The Cohen mirror was removed. The retained Milnor locators in supplier exposition have **not** been certified from that book by this review; the independent public K-book statements and the explicit supplier proof decomposition are what I checked. No restricted file or passage was copied.

### Random locator sample

For reproducibility, the sample was selected by `random.Random(11374).sample(nodes, 15)` from the 54 input targets, then the corresponding package locators were opened. The delicate earlier findings and unproved supplier promises were checked in addition to this sample. Some targets share a source; these are fifteen sampled target-locator checks, not fifteen distinct papers.

| Sample, in selection order | Verified locator |
|---|---|
| Gamma-factor values | K-book VI.8.8 proof, p.516 |
| Golden w₂ | Kolster 2009 p.15; explicit cyclotomic calculation in ArithmeticKTheory §4 |
| Positive real zeta | K-book VI.8.8 proof p.516; direct nonnegative ideal-series argument against pinned definitions |
| Localization naturality | Kolster 2009 pp.8,13–15; K-book V.11.11–11.13 pp.457–459 and VI.9.4–9.5 pp.519–520 |
| Sign at −1 | K-book VI.8.6–8.8 pp.515–516 |
| Multiplicative formula | K-book VI.8.6 p.515; Kolster 2009 p.15 |
| w₂/H¹ | Kolster 2009 pp.9–10 |
| Higher abelian values | K-book pp.515–516; Rognes–Weibel Theorem 0.2 p.2, A.1–A.3 pp.45–49 |
| S-modified zeta | Kolster 2009 p.8 |
| K₂(S) order | K-book V.6.8 p.412 |
| Tame two-part through Iwasawa | Kolster 1989 Theorem 1 p.249 |
| Odd Lichtenbaum | Kolster 2009 pp.11,15 |
| Deleted Euler factors at −1 | Kolster 2009 p.8; explicit finite-product calculation |
| Abelian Birch–Tate | Greither 1992 §1 p.454, with Kolster's implication |
| All-field Birch–Tate | Kolster 1989 Theorem 5 p.250 plus Kurihara 2025 Theorem 4.1 p.24 |

## Library and current-roadmap duplication audit

Read the reviewed library audit and actual declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Also checked current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`. The atlas base was `359716a86e1feaef7af3ccc4c3dd84236004aaf4`. Read two upstream exemplars, ArithmeticDirichletSeries and ProfiniteArithmetic, in README/Suggested form.

The object search included ideal-count L-series, deleted Euler factors, quadratic ring generators/splitting, cyclotomic invariants, valuation uniqueness, global twisted H¹/H², classical K₂ and finite-field localization, norm-minus class groups, regulator lattices, relative K₀ and determinant lines. I inspected actual structure fields, operators and hypotheses, not only candidate names. Searched the nine newer roadmap directories and all their nested Suggested files, as well as Completed/ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. For example, de Rham targets in DifferentialGeometry are not the missing integral motivic lattice; lattice discriminants in IntegralLattices are not Borel regulators; LocalGaloisGroups does not supply the global S-integer comparison; EffectiveBounds' unit regulator is not the positive-weight regulator.

Existing boundaries remain correct: current Tau Ceti's `dedekindZeta_ofReal_eq_exp_tsum_neg_log_one_sub`/`dedekindZeta_re_pos`, `LSeries_ofBadPrimes`, `exists_differentiableOn_eq_LSeries_ofBadPrimes_sub`, and `NumberField.Sqrt5` arithmetic are consumed, not replanned. Their modules are given in the package. This review found no additional target requiring removal or transfer. The kept lower bound ≥1 and negative-integer Euler-factor applications state the differences from those existing results. No command built or updated the read-only current upstream environment.

## Lean signature comparison and validation

All twelve retained theorem statements were compared to the README, exceeding the required ten-signature spot check.

| Lean declaration(s) | README match and material hypothesis |
|---|---|
| `gammaℝ_neg_one`, `gammaℝ_two` | §2.1, regular values −1 and 2, complex-valued factors |
| `gammaℝ_one_sub_two_mul`, `gammaℝ_two_mul_pos` | §2.1, natural k≥1 and positive real witness, parity sign retained |
| `one_le_dedekindZeta_ofReal` | §2.2, arbitrary number field and σ>1; raw series only in convergence region |
| `rat_eq_iff_forall_padicValRat_eq` | §2.6, positive q and r, all primes |
| `abs_eq_natCast_div_iff_forall_padicVal` | §2.6, q≠0, k,w>0; valuations compared in ℤ |
| `LFunction_chiFive_neg_one` | §3.2, native character L-function and value −2/5 |
| `differentiable_sEulerFactor` | §4.1, all finite sets of actual finite primes, no choice of rational splitting |
| `sEulerFactor_one_sub_natCast` | §4.1, n≥1, exponent n−1 |
| `sEulerFactor_neg_one` | §4.1, sign (−1)^card S and product Nv−1 |
| `sEulerFactor_one_sub_ne_zero` | §4.1, stronger n≥2; n=1 deliberately fails |

The two `#check`s pin genuinely used ideal-count/summability declarations, not a catalogue. The only instance supplies the proved primality of 5. There are no admitted examples, sorry'd data, `True` placeholders, ad hoc computational algorithms, `set_option`s, auxiliary theorem chains or invented heavy carriers. Four proved examples test exactly `chiFive` and `sEulerFactor`, independently of the twelve admitted target statements.

Final checks and submission evidence are recorded in the accompanying handoff. The review remains needs_changes because of F1–F4 even when elaboration and mechanical checks pass.
