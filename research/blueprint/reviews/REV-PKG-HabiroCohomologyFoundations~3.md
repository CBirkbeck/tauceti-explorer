# Independent package review: HabiroCohomologyFoundations, round 3

**Verdict: accepted with the corrections in this change.** This is a complete
review of issue #9218 by Codex, session codex-XA2suP, dated 2026-10-13. I did
none of the three package jobs. The revised package is ready for its upstream
draft PR; this verdict does not assert that its planned theories have been
formalized or that its explicitly identified mathematical problems are solved.

## Inputs and form

I read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md (including §§5, 13 and 20),
the expansion protocol, UPSTREAM_GUIDE.md, the round-2 review and round-3
package handoff. I compared the complete README and Suggested.lean with all
four accepted packets: HQ.1, HQ.1-2, HQ.3 and HQ.8. Packets were not edited.
AnalyticToricGeometry and AlgebraicVectorBundles, both README and
Suggested.lean, supplied current upstream form and boundary examples. The
package has an opening Summary, scope, conventions, exact supplier contracts,
ordered layers, worked examples, downstream consumers and fixed references.
The single metadata line remains `topic = "math.AG"`.

| Accepted input | Nodes | Named API items | Input tests | Package destination |
| --- | ---: | ---: | ---: | --- |
| HQ.1 | 122 | 212 | 129 | Layers 1–8 |
| HQ.1-2 | 7 | 21 | 11 | §1.19–1.21 and §4.25–4.27, §3.31 |
| HQ.3 | 3 | 16 | 7 | §1.26–1.28 |
| HQ.8 | 19 | 17 | 6 | Layer 9 |
| Total | 151 | 266 | 153 | 151 distinct numbered subsections |

Every accepted node maps to exactly one subsection; every accepted API name
remains. I read the statements, hypotheses, prerequisites and tests against
those subsections, not merely their headings. The test asserting a false
value for derived de Rham of 𝔽_p was corrected as described below. The README
has 2,267 lines, 44 Checks blocks and 174 individual Checks, with a minimum of
three per definition. Extra checks distinguish static from derived pullbacks,
coherent quotients from coarse quotients, and affine perfectness from
compactness of a representation. No target or hypothesis was dropped for size.

## Corrections

1. **Derived de Rham torsion (§1.3).** The packet's
   `qdRLocal_Fp` test identified p-completed dR_{𝔽_p/ℤ_p} with ℤ_p. That
   conflates derived de Rham with crystalline cohomology relative to the
   specified PD base. The package now uses the derived p-completion of
   `[ℤ_p⟨x⟩ --(x−p)--> ℤ_p⟨x⟩]`, in degrees −1 and 0. At p=2 its
   degree-zero quotient has nonzero 2-torsion represented by x^[2]−2:
   multiplication gives 2x^[2]=x²=4, while its mod-2 class survives quotient
   by (x). Bhatt Proposition 8.5 and Corollary 8.6 (§8, p.32) give the
   two-term description and torsion boundary. DD.4's supplier plan already
   records this distinction. The added Lean example proves the integral
   quotient multiplication relation, not completion or nonvanishing.
2. **Current-library duplicate.** Removed the package-added `torusCharacter`
   API bullet and Lean definition. Current Tau Ceti already supplies character
   evaluation and its additive, negative and integer-scaling laws. The scope
   section cites them. The retained `torusScale` target constructs an algebra
   automorphism and coherent lattice action; its Lean signature uses the
   character's explicit monomial value without planning evaluation again.
3. **Lattice quotient and dependency direction (§1.23–1.28).** Corrected the
   self-dependency of derived modified q-connections. They depend on the
   already specified lattice action and E0/E1, with E5 coherent limits. The
   quotient target retains the groupoid realization, its flat sheafification,
   enhanced QCoh totalization and Mod_HC≃D(C). The infinite constant lattice
   map is not assumed to be a quasi-compact fpqc cover. Stabilizers are ℤ^d
   at q=1 and Nℤ^d for a primitive root of order N, not finite cyclic groups.
   Ordinary vector-bundle geometry is deferred to AlgebraicVectorBundles
   L0B/L2B; the retained variant adds the specified semilinear action.
4. **Discriminating quotient checks.** Rank zero gives Spec B; the identity
   rank-one action gives Spec C×Bℤ and H¹ of the structure sheaf is C. At
   q=−1 the stabilizer is 2ℤ. A coordinate scaling at q=2 is semilinear,
   the zero module has rank zero, and C[ℤ] is compact as its own module but
   infinite free over C. These prevent collapsing the quotient or identifying
   representation compactness with local perfectness on its atlas.
5. **Actual supplier contracts.** Specified HR.3's homotopy equalizer of
   mapping spaces, PR.1/PR.2's bounded-prism complete animation domains,
   PerfectoidQuotients Q3's actual distinguished ξ with δ(ξ) a unit, and
   HC.3's integral Taylor coefficients and topologically nilpotent root
   difference. E0/E1's quotient use includes flat module descent and tensor
   pullback. CR.0 and CP.6 now occur in the ownership map as well as the
   target dependencies. Native divided-power multiplication is explicitly
   distinguished from universal completed PD/q-PD envelopes.
6. **Twisted objects and filtered negative controls.** §3.15 distinguishes
   the p-completion of the smooth twisted qΩ from animated twisted qdR.
   §4.9 uses the fixed unit filtration over ℤ[q] to make Φ's nonunit failure
   concrete. §5.17 uses A=R=ℤ_p: the ordinary preimage of hℚ_p[[h]] in
   ℤ_p[[h]] is hℤ_p[[h]], whereas its derived pullback has H¹=ℚ_p/ℤ_p,
   detected by 1/p. An arbitrary conditional failure has become a computed
   negative control.
7. **Relative ordinary-to-q-Witt map (§3.6, §9.11).** QW Remark 3.18 invokes
   absolute initiality but claims a map from the relative ordinary complex.
   The factorization killing dW_{a+1}(A) needs a separate HQ.4/CR.4 proof.
   Restored that obligation explicitly; forgetting restriction operators
   does not prove the relative factorization. The cyclotomic square remains
   a target with its canonical map and normalization, not a verified comparison.
8. **Locators.** Corrected the page ranges for QH Convention/Paragraph 1.22,
   Paragraph 3.2(c), the torus-action source, the quotient-descent source,
   BS's q-derivatives and Sch's polynomial example. The exact changes are
   recorded in the source tables below.

The first correction must be reconciled with the immutable HQ.1 packet's
`qdRLocal_Fp` test by the maintainer. This review neither edits that packet nor
claims another job. The package's corrected mathematics is the result to port.

## Earlier objections R1–R8

| Objection | Check of final package |
| --- | --- |
| R1: unrelated module families | One common enhanced functor, its natural comparison maps and complete gluing diagram remain required. |
| R2: arbitrary Nygaard generator | Actual perfectoid quotient and perfect prism, distinguished ξ and δ(ξ) a unit; no arbitrary terminal object replaces them. |
| R3: fake cotangent/free δ witnesses | Full cotangent derived Tor and actual free p-complete δ-ring universal property; higher-power and α=1 examples retained. |
| R4: underspecified envelopes | One P↠S and J, canonical universal completed PD/q-PD envelopes, induced base-change maps, regularity, flatness and torsion-free convergence hypotheses. |
| R5: arbitrary ambient categories | Actual enhanced module categories, coherent groupoid quotient and flat sheafification; ordinary categories cannot stand in for them. New lattice and perfectness tests exercise the distinction. |
| R6: cokernels/kernels for derived constructions | Enhanced cofibres/fibres throughout, except the explicitly static naive preimage. Native zero-map cone retains both H⁻¹ and H⁰=ℤ/2. |
| R7: arbitrary q-Witt/ghost rings | Initial relative q-FV-system, coefficient-balancing ideal, ghost target R⊗_{A,ψ^d}A[q]/Φ_d(q), exact divisor and torsion assumptions. |
| R8: unconstrained framed comparison | Canonical truncated pullback filtration, its fixed framed identification reducing to the identity, and the smooth dimension/prime-inversion domains remain explicit. |

Round 3's compact Lean file no longer contains the round-2 fake carriers.
I checked the repairs in the README, where the heavy targets now live, and
the ten retained definition/theorem signatures below. Old countermodel files
were not rerun against a declaration collection that no longer exists.

## Source audit

I opened the fixed public PDF versions in the package and read the cited
pages. No private library source was used. I found no additional author-marked
unverified locator; an unobtained thesis and source assertions without proof
remain recorded as limitations, rather than being cited as verified proofs.
The random sample was drawn reproducibly with seed 9218 from the first locator
of each of the 151 numbered subsections, without replacement. All statement
numbers in each sampled locator were checked, including multi-source rows.

| Sample | README | Fixed source and printed location | Result |
| ---: | --- | --- | --- |
| 1 | §3.21 | QH Lemma 3.30, §3, p.40 | Divided Frobenius pullback confirmed. |
| 2 | §9.16 | QH Remark 1.13, p.7; Paragraph 1.10, p.6; Sch §2, p.4; BS Theorem 17.2, p.117 | Polynomial example tightened from Sch pp.3–4 to p.4. |
| 3 | §9.7 | QH Proposition 3.47(b), p.48; BMS1 Lemmas 6.4, p.49 and 6.20, p.55; BMS2 Proposition 5.8, p.32 | Objects, torsion correction and décalage domains confirmed. |
| 4 | §4.22 | QH Proposition 3.47, p.48; Remark 3.6, p.22 | Completion/décalage distinction confirmed. |
| 5 | §9.10 | BS Theorems 15.2–15.3, pp.102–103; QH Proposition 3.22, p.32 | Prismatic Nygaard construction precedes trace comparison. |
| 6 | §3.7 | QW Paragraph 3.15, p.41; Corollary 3.34, p.52; Lemma 4.5, p.55; Lemma 2.23 and Corollary 2.22, p.20 | Cyclotomic twists and torsion-dependent injectivity confirmed. |
| 7 | §5.7 | QH Paragraph 4.8, p.56; Lemma 4.10, p.57 | Bounded categories and compatible sections confirmed. |
| 8 | §3.1 | QW Definitions 3.1, p.37 and 3.9, p.40; Remark 3.10, p.40; Lemmas 3.2 and 3.4, p.38 | Actual relative systems and torsion-free variant confirmed. |
| 9 | §1.27 | DAG VIII Proposition 2.7.6 and Definition 2.7.8, p.71; Remark 2.7.10, Proposition 2.7.14 and Remark 2.7.15, p.72 | Replaced broad pp.66–76 by these exact pages; retained sheafification. |
| 10 | §3.29 | QH Lemma 3.29, §3, p.38 | Rationalized combined filtration confirmed. |
| 11 | §9.13 | QH Theorem A.1, p.69; Propositions 3.19, p.31 and 3.22, p.32 | Cited comparisons located; arbitrary choices would not prove commutation. |
| 12 | §6.5 | KU Corollary 6.15, §6, p.86 | Genuine fixed-point arithmetic statement confirmed. |
| 13 | §3.12 | QW Corollary 4.37, §4, p.76 | Arithmetic fracture square confirmed. |
| 14 | §3.14 | QW Theorem 5.1, §5, p.78; QH Paragraph 1.10, p.6 | Functoriality obstruction confirmed; chosen filtrations remain necessary. |
| 15 | §2.4 | QH Paragraph 1.22(b), p.11; Paragraph A.14, p.76 | Paragraph 1.22(b) was incorrectly cited on p.10; fixed. |

Additional targeted readings checked the actual repairs and earlier objections:

| README/interface | Public statement read | Finding |
| --- | --- | --- |
| §1.3 | Bhatt Proposition 8.5 and Corollary 8.6, §8, p.32 | Two-term PD model and torsion, not ℤ_p. |
| §1.5–1.11, supplier envelopes | QH Appendix A.1, pp.70–76; BS Lemma 16.10, pp.110–111 | Common presentation and universal envelope maps essential. |
| §1.23 | Sch §8, p.16, with §7 application, p.15 | The action is not Theorem 7.3; fixed attribution. |
| §1.24 | Sch Theorem 7.4, p.15 | Ordinary framed dictionary; invertible semilinear variant is separately specified. |
| §1.25–1.28 | DAG VIII §2.7, pp.71–72 | Scholze Conjecture 7.5 does not establish the proposed lattice descent. |
| §2.1–2.7 | QH 1.22(a), pp.10–11; (b), p.11; (c), pp.11–12; (d), p.12; 3.2(c), p.21 | Page numbers repaired; cofibres and completion order preserved. |
| §3.6, §9.11 | QW Remark 3.18, p.42; initial relative q-FV rings, §§2.5, pp.30–31 | Relative factorization obligation retained explicitly. |
| §3.15 | QH Paragraph 3.14, p.28 | Smooth qΩ and animated qdR are separate constructors. |
| §4.17–4.19 | QH Paragraph 3.45, p.47 | Coherent partial descent and symmetric monoidality are actual targets. |
| §5.2–5.7 | QH pp.54–57 | Canonical truncation/pullback, dimension and inverted-prime bounds. |
| §5.17–5.20 | QH Construction 4.21, p.62; Example 4.24, pp.63–64; Lemma 4.26, p.64 | Static preimage, higher powers, p=2 and α=1 failure. |
| §9.5 | BS §16.3, p.114; Theorems 16.21–16.22, p.115; Theorem 17.2, pp.117–118 | q-derivative source was p.107; corrected to p.114. |
| Supplier descent | ALB Theorem 3.1.7 and Remark 3.1.8, p.17 | Enhanced flat descent carries hypotheses, not an ordinary category identity. |

The package's References fix QH v2, QW v5, KU v1, TC v4, BS v4,
BMS1 v3, BMS2 v2, Sch v1, Bhatt v1 and DAG VIII's dated version.
No wording or passage from a paper was committed. A 14-word alphabetic-window
screen against all eleven downloaded public PDFs found zero overlaps with the
README; the manual read also checked own-word synthesis and build order.
This screen supplements, rather than proves, the writing audit.

## Dependencies and duplication

I read the relevant supplier packets and the reviewed library-coverage entries,
then checked actual declarations at the compilation pins. EDS is tier 4,
DD/CR tier 9, AI/PR/PerfectoidQuotients are in the tier-13 bundle, and CP is
tier 14 in CaraianiNewton.md. Habiro and RefinedTraceMethods lie outside its
94-roadmap tier list; I did not invent a numeric tier for them. Their explicit
supplier contracts remain prerequisites for porting. HR and HC supply rings,
completion and Taylor calculus; this package owns the shared HQ.1 framed and
HQ.4 positive-degree calculus. HB and HR.6 are downstream consumers only.
AnalyticHabiroStack supplies the language of the open analytic problem and is
not an algebraic dependency. No FoundationsAndLibraryIntegration or UPSTREAM
pseudo-prerequisite remains. Every target's dependency is a native API, an
existing upstream layer, a named external supplier contract or an earlier
internal construction; HQ.4 is built before HQ.3 to prevent a Nygaard cycle.

The current read-only upstream root was commit
`0d144d044dacebca17b654695b6f1ad58f159b27`, and current Tau Ceti was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. I searched all current roadmap
README/Suggested files and Completed, using mathematical families as well as
names: Jackson/twisted derivation, q/FV systems and cyclotomic ghosts,
Habiro/Taylor gluing, Hodge/Nygaard filtrations, coherent lattice actions,
perfect complexes, full cotangent versus Kähler differentials, completed
PD envelopes, prismatic comparisons and arithmetic fracture squares. The
nine newer roadmaps and Completed ContourIntegration, EffectiveBounds,
OrthogonalL2Bases and RestrictedProducts were included. Unrelated semiperfect
noncommutative rings and quiver `q fV` matches were not treated as suppliers.

The concrete removal is `torusCharacter` and its API/Lean definition, supplied
by `TauCeti/LinearAlgebra/Basis/DiagonalTorus/Basic.lean`, with
`TauCeti.torusCharacter_add`, `_neg`, `_zsmul`. Ordinary vector-bundle geometry
is deferred to AlgebraicVectorBundles L0B/L2B in Scope; the kept application
states its added semilinear equivariance. The current Galois
`groupAlgebraAction` changes coefficients and exponents; it does not already
supply this q-monomial scalar action. No other equivalent package target was
found. This is a search and statement comparison, not a claim to have read
all unrelated matching files in full.

Native APIs additionally checked include geometric sums, prime and prime-power
cyclotomic formulas, AddMonoidAlgebra, AlgEquiv, Algebra.Etale/Smooth,
Module.Finite/Projective, Kähler derivation, regular sequences, ordinary
limit/colimit comparison maps, cyclotomic association, Witt Fontaine θ and
Teichmüller formulas, DividedPowerAlgebra.dp_mul and the actual cochain
mapping cone. In particular θ needs prime p, nonunit p and p-adic completeness;
cyclotomic association needs a field and primitive root; ordinary
preservesLimitIso does not construct enhanced completion or descent.

## Adversarial mathematical pass

I walked every numbered subsection's statements, conventions, API assertions
and Checks. The table groups those statements by shared hypotheses; the
ranges cover all 151 targets. “Retained” means that the displayed restricted
claim survived the instances tried, not that its future proof was supplied.

| Targets | Instances and failure mechanisms tested | Result |
| --- | --- | --- |
| §1.1–1.2 | q=1, constants, n=0, q=2 cubic; prism ([p]_q) versus q-PD (h) | Jackson specializes to derivative; the two ideals are distinct. |
| §1.3–1.4 | R=A and R=𝔽_p, p=2; rationalization before/after completion | Corrected false 𝔽_p value; smooth and derived inputs kept separate. |
| §1.5–1.8 | n=0 denominator 1, n=2 denominator 64, p=2; one P,J and actual envelope operations | Nonzero uniform denominator; no exchanging an infinite prime product without estimate. |
| §1.9–1.11 | One coordinate, zero endomorphism, commuting versus noncommuting twists | Actual commuting automorphism hypothesis and canonical comparison retained. |
| §1.12–1.16 | Identity algebra, polynomial line, identity/composite framings | Common enhanced pullback, completed tensor and cocycle maps retained. |
| §1.17–1.21 | Identity cover, two overlapping charts, constant/empty diagram distinctions | PD/Čech totalization and coherent étale sheaf descent retained. |
| §1.22 | Zero/free rank-one modules, q=1, noncommuting coordinate operators | Flat q-connection and twisted Leibniz law retained. |
| §1.23–1.25 | d=0, exponent −1, primitive root, q=1 | Units required for negative powers; corrected action/descent locators. |
| §1.26–1.28 | d=0, q=1, q=−1; zero module, semilinear Γ, regular representation | Repaired dependency and sheafification; added infinite-stabilizer/perfectness checks. |
| §2.1–2.3 | Zero scalar on ℤ/2, m=0, βt=q^m−1 at (2,3,1) and (2,2,1) | Cone retains H⁻¹; m≥1 for cyclotomic targets; degree convention fixed. |
| §2.4–2.6 | Polynomial versus regular quotient, identity base change, completed versus plain tensor | Animation and required completion retained; torsion examples distinguish derived answer. |
| §2.7–2.11 | h=0, rational object p-completion, then p-inversion in opposite order | Shift, filtration and noncommuting rational/completion order retained. |
| §3.1–3.5 | m=1, divisors d|m, zero and torsion-free modules, degree zero | Actual relative initial systems; no invented restriction maps. |
| §3.6–3.7 | W_{a+1}(A)-differentials, coefficient twists, torsion ghosts | Explicit relative factorization obligation; torsion hypotheses retained. |
| §3.8–3.11 | Identity étale map, smooth polynomial input, prime-power factor | Coefficient balancing and étale extension distinct from arbitrary DGA replacement. |
| §3.12–3.17 | q=1, m=1, p-powers and rational fracture, chosen versus functorial q-Hodge object | Smooth/animated twist distinction corrected; no universal choice of filtration asserted. |
| §3.18–3.23 | i=0, derived regular quotient, divided Frobenius and associated graded shift | Forms in degree i and actual enhanced fibres/cofibres retained. |
| §3.24–3.31 | Zero maps, p=2, p-inversion, Nygaard versus conjugate/stupid pieces | Kernel/fibre distinctions and uncompleted framed Habiro Koszul contract retained. |
| §4.1–4.3 | Étale unit pair, genuine free δ-ring, α=1 witness at p=2 | Four coherent conditions and nonexistence obstruction retained. |
| §4.4–4.7 | Degree zero, zero module, h=0 before/after modification colimit | Completed colimit and graded shifts retained. |
| §4.8–4.11 | Polynomial line, q=1, fixed unit filtration, p-power recursion | Concrete nonunit rescaling check repaired; canonical twists retained. |
| §4.12–4.16 | m=1, factorial transitions, Φ_p versus q^p−1, derived reduction | Adjoining divided Nygaard differs for the two denominators; completion remains explicit. |
| §4.17–4.24 | Étale degree-zero case, polynomial differential (q^n−1) versus [n]_q, Bockstein | Symmetric monoidal descent, smoothness and chosen-filtration hypotheses retained. |
| §4.25–4.27 | Identity/zero finite-projective extension; plain flat extension of infinite limits | Finite projectivity and suppliers' coherent limit exchange retained; no arbitrary flat theorem. |
| §5.1–5.4 | n=0, n=1, framed polynomial line, dimension >n | Actual canonical truncated pullback; invalid dimension/prime bounds excluded. |
| §5.5–5.8 | Prime p>n versus p≤n, successive n,n+1 bounds | Compatible p-complete descriptions and bounded-category gluing retained. |
| §5.9–5.12 | Dimension 0, two positive-dimensional factors, three factors | Partial operadic bounds distinguish a tensor-closed étale category from smooth domain. |
| §5.13–5.14 | Spec ℤ, affine line, smooth proper base ℤ[1/N] | Scheme construction's ℤ domain retained; global perfectness proof explicitly outstanding. |
| §5.15–5.16 | Identity cotangent, polynomial 𝔽_p input, ℤ→𝔽_p, component where p invertible | Full Tor complex; amplitude [0,1] not substituted for degree 1. |
| §5.17–5.18 | A=R=ℤ_p, hℚ_p[[h]], nonzero 1/p class; F^n∩hQ | Added explicit derived-pullback H¹ negative control; filtered injection not surjection. |
| §5.19–5.21 | α=1 versus α≥2, p=2, higher regular powers, faithful flat perfection | Obstruction and correction remain different; no odd-prime restriction silently added. |
| §5.22–5.25 | Étale inputs, identity, tensor of quasi-regular inputs, smooth versus condition (R) | Sections' domains and uniqueness data retained; no unconditional smooth/naive agreement. |
| §6.1–6.5 | ku versus spherical E₁ lift, p=2 power issue, identity arithmetic base | Trace prerequisites explicitly imported; genuine fixed points retained. |
| §7.1–7.3 | Small primes, root re-expansion, absent analytic source | Open comparison remains a problem; analytic language does not imply equivalence. |
| §8.1–8.2 | Native polynomial, étale degree zero, derived zero-map cone | Worked examples agree with actual carrier availability. |
| §9.1–9.3 | Arbitrary corner isomorphisms, primitive roots, cyclotomic versus h completion | Canonical four arrows and homotopy required; coefficient changes stated. |
| §9.4–9.6 | Frobenius twist, framed line, actual perfectoid ξ and θ | Corrected q-derivative page; no ordinary PD or arbitrary perfectoid replacement. |
| §9.7–9.10 | Zero scalar, p=2, q=1, independent trace filtration | Torsion correction and noncircular prismatic construction retained. |
| §9.11–9.12 | Relative Witt coefficients, q=1 torsion, absent q-Witt restrictions | Relative factorization explicit; no inverse or restriction map invented. |
| §9.13–9.17 | p=3 sign (q−1)²+3q=[3]_q; dlog T and degree zero | Fixed sign witness proved in Lean; canonical squares remain actual targets. |
| §9.18–9.19 | S=ℤ versus ℤ[T,T⁻¹], θ/Witt on coefficients and dlog T | Equality of two canonical composites is outstanding, not implied by object equivalence. |

All denominators are either explicit nonzero integers, a unit-valued torus
parameter, or named derived localizations/divisibility constructions with their
regularity/completion assumptions. No general DVR formula was inferred from
an ℤ_p calculation. The README's ℤ, fixed-prime, perfectoid, and smooth-base
domains remain distinct. The zero ring/module and identity functor cases were
used where the corresponding hypotheses permit them; a unit-ideal envelope
is not substituted for an admissible q-PD presentation.

## Ten Lean signature checks

The final file has four real-bodied light definitions, six milestone theorems
with `sorry`, thirteen proved examples and no admitted data. Heavy constructions
are named in its closing comment and retain their complete README statements.

| Declaration | Comparison with README and adversarial witness |
| --- | --- |
| `qDiff` | Finite polynomial sum over arbitrary commutative ring; constants vanish, cubic at q=2 gives 7X². |
| `jackson_calculus` | Polynomial divided-difference identity, twisted product rule and q=1 derivative; no field or division assumption. |
| `uniformDenominator` | Finite product over primes ≤n with QH A.11 exponent; n=0 gives 1, n=2 gives 64. |
| `uniformDenominator_pos` | Positivity concerns this integer only, not a fictitious envelope map. |
| `torusScale_exists_unique` | Laurent AddMonoidAlgebra, q a unit, integral lattice and coefficient-linear algebra automorphism; d=0 and exponent −1 checked. |
| `coefficientRelation` | Actual MvPolynomial in order (q,β,t); weighted degree zero. |
| `coefficientRelation_eval` | βt=q^m−1; theorem valid for natural m, README's cyclotomic use separately requires m≥1. |
| `derived_quotient_torsion_witness` | Actual CochainComplex.mappingCone of zero map on single ℤ/2; H⁻¹ and H⁰, not ordinary cokernel. |
| `qHodgeDiff` | h times native Jackson operator; agrees with framed q-Hodge polynomial example. |
| `qHodge_polynomial` | (q^n−1)X^(n−1), including n=0, and zero differential at q=1; arbitrary commutative ring. |

## Verification and remaining work

- `lean-check` on the final package Suggested.lean: **exit 0**, six `sorry`
  warnings, no errors or other warnings. File length: 220 lines. The 13 examples
  are proved. This checks elaboration, not the six milestone proofs.
- A separate native API inventory: exit 0; 32 declaration statements inspected.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- `python3 scripts/check_blueprint.py` on all four immutable input packets:
  exit 0, zero errors and warnings.
- `python3 research/blueprint/intake.py check-files` on the package and review
  deliverables, including this handoff: exit 0, zero problems.
- `git diff --check`: exit 0.

The 21 input gap records (HQ.1: 14; HQ.3: 2; HQ.8: 5) were read against their
package destinations. Their source-assertion proof limits, trace-supplier work,
analytic-stack gap, solid completion supplier, coherent descent, conditional
finite-projective base change, partial operadic multiplicativity, global
perfectness and the θ/Witt compatibility equalities remain visible. In
particular §5.14, Layer 7 and §9.18–9.19 do not masquerade as proved
comparisons. The newly explicit relative Witt factorization belongs with
HQ.4/CR.4. Implementation must supply these proofs and enhanced carriers; this
package does not claim them. No unfixed package-format or signature defect
remains. Porting must preserve these boundaries and reconcile the corrected
immutable 𝔽_p test rather than reinstating it.
