# Independent package review: K2SymbolsBrauer

Job: `REV-PKG-K2SymbolsBrauer~codex2`, issue #11348. Reviewer: Codex,
session `codex-14uKhl`. Date: 2026-10-20.

**Verdict: accepted, with the corrections in this submission.** The package is
ready for a draft TauCetiRoadmap pull request. This is acceptance of a roadmap,
not a claim that its mathematical targets have been formalised.

## Scope and governing instructions

I read the complete README, its 139 numbered subsections in thirteen layers,
the 367-line Suggested.lean, metadata, the fourteen packet files and their target
inventory, the previous independent review `REV-PKG-K2SymbolsBrauer~adv.md`,
and the latest fix handoff `FIX-PKG-K2SymbolsBrauer~adv3.md`. I checked the
reviewed library audit and the current upstream roadmaps and library as well as
the pinned APIs. I did not author the package or its previous fixes.

The issue's old title names a different subject, and its single packet and
previous-review filenames do not exist. The actual subject, fourteen packets,
existing review, and latest fix handoff unambiguously identify this package.
The current PACKAGE_REVIEW.md shape rule expressly supersedes older size
notes: the full README is therefore retained rather than cut to the issue's
older 200 KB limit. Its mathematical content, hypotheses, API and Checks are
the deliverable. Suggested.lean is far below the binding 5,000-line ceiling.

The issue explicitly permits a correctly stated published theorem with an
exact locator as a prerequisite, without decomposing its published proof.
It also explicitly permits secondary verification of Dennis–Stein 1975 and
Maazen–Stienstra 1977. I applied that instruction to the three previously
flagged inputs; their precise mathematical statements remain in the README.
No unproved construction is disguised as a library declaration.

## Corrections made

1. **§6.8:** removed the extraneous assumption that `1-r` is a unit from
   `{r,-r}=1`. Added Checks over the integers, at `r=1`, and over the reals
   that separate this identity from the nonzero integral diagonal symbol.
2. **§8.2:** identified the rational-field non-surjectivity Check as a
   statement about degree three. The degree-two comparison is an isomorphism.
3. **§§9.14 and 9.18:** removed process language from mathematical targets.
4. **§10.33:** replaced an unsupported ClassFieldTheory supplier edge for
   positive-characteristic global fields by the published Bass–Tate theorem,
   Part II, Theorem 2.1(3), p.396. The current ClassFieldTheory contract used
   in §10.32 is for number fields. The README now gives the finite-tuple
   reduction covering fields of transcendence degree one that are not
   themselves finitely generated.
5. **§13.6, lift-change Check:** a nonliftable admissible pair for
   `ℤ→𝔽₅` does not prove failure of surjectivity of `D(ℤ)→D(𝔽₅)`;
   the target is zero. The Check now states exactly what it disproves:
   the individual-pair lifting argument without a radical kernel.
6. **§13.6, DVR input:** stated the published presentation with its actual
   ranks `3≤n≤∞`, generator map, and absence of residue-size or section
   hypotheses. The former missing-proof marker is replaced by the exact
   Dennis–Stein input, checked through the sources listed below.
7. **§13.8:** replaced the missing-proof marker by the published
   Keune–Loday comparison for the actual double ring. The text still
   distinguishes that degree-two theorem from GeneralAlgebraicKTheory
   §10.12, which does not supply it.
8. **§13.9:** made the generation API explicitly subject to the standing
   radical hypothesis. Stated Maazen–Stienstra injectivity for every
   commutative split radical pair, including finite ranks `n≥3`, without
   restricting it to local rings or nilpotent ideals. Replaced the obsolete
   proof-decomposition gap by this published input.
9. **§13.11:** replaced vague Checks by explicit differential values and a
   nonzero square-zero kernel example. For
   `A=ℚ[x,y]/(x,y)²`, `I=(x,y)`, the target of the differential is zero,
   while the determinant pairing on linear coefficients detects `D(x,y)`.
   This prevents incorrectly killing the square-zero-symbol subgroup even
   when 2 is invertible.
10. **Locators:** corrected Exercise III.5.14(b),(c) to printed p.230
    (the combined (a)–(b) citation is pp.229–230). Added an accessible
    finite-rank containment locator, Moreno Ramírez, Theorem 4.3.22,
    pp.108–109, and the public Steinberg scan to the references.

11. **§§6.17 and 9.10:** added a real toral-defect control for the Bruhat
    quotient and explicit values at `1`, the uniformizer and its inverse
    for Serre's degree-one map, so each defining construction has at least
    three Checks.

Suggested.lean and metadata needed no changes. No theorem's generality was
reduced, and no retained target was removed to shorten the package.

## Sources and the previously flagged inputs

All source material was read as mathematical data. No source passage has been
added to the repository. PDF page indices were checked against printed page
numbers; Weibel's book has an eight-page offset, and LNM 342 a ten-page offset.

| Input | What I could read and verify | Consequence |
| --- | --- | --- |
| Dennis–Stein local base case, including residue fields 2 and 3 | Dennis–Stein survey §12, pp.253–254; van der Kallen–Maazen–Stienstra §2.2 and Theorem 1, pp.934–935; Weibel III.5.11.1(a), p.226 | The D1–D3 generator map for a DVR and its homomorphic images is the stated presentation, in ranks `3≤n≤∞`. No section, large residue field, or inverse of 2 is required. |
| Split radical presentation | van der Kallen–Maazen–Stienstra §2.5 and Theorem 2 in §2.6, p.935; van der Kallen 1978 §3, p.309 | The input is a commutative ring, radical-contained ideal, and unital ring section; the relative-symbol group identifies with the absolute kernel, also for finite `n≥3`. |
| Keune–Loday comparison | Weibel IV.1.11, p.268, together with III.5.7, pp.222–223; van der Kallen 1978 §1, p.307; Levine §2.1, pp.289–290 | The actual relative Steinberg group formed from the double agrees with homotopy-fibre K₂. General degree-two excision is not inferred from a nonpositive excision theorem. |
| Relative D3 guard and modern convention | Dennis–Stein 1973 §1, pp.283–284; van der Kallen–Maazen–Stienstra §2.5, p.935; van der Kallen 1978 §3, p.309 | The guard is on an input, not merely its products. The first-input and any-input forms are equivalent using D1. The modern conversion is `D(r,s)=P(-r,s)`, without a further inverse. |
| Integer reduction and finite-rank monomial statements | Moreno Ramírez §4.3, especially Theorems 4.3.18 and 4.3.22, pp.103–104 and 108–109; §4.4.1, pp.112–119; Steinberg §6, pp.66–72; Weibel III.5–III.6 | These accessible statements, the README's own word calculations, and the explicit matrix controls support the retained targets without treating an unavailable book as newly read. |
| Products and signs | Loday 1976 §§2.1–2.2, pp.335–340; Waldhausen 1985, pp.342, 375–376; Weibel 1981, diagrams 4.1–4.2 and Theorem 4.3, pp.503–505; Weibel IV.1.10.1, p.266 | The bar sign, product comparison, and normalized degree-two map are separate claims with explicit conventions. |
| Complete valuations and norms | Weibel III.7.4–III.7.6, pp.247–252; Stacks tags 032W, 09EM, 04GH and 02MJ | Finiteness of normalization, completion factors, and residue degrees are used with their hypotheses; imperfect residue fields and inseparable extensions are not discarded. |
| Integral curve reciprocity | Suslin 1980, §§1.9–1.10, p.594, and §§2.1–2.6, pp.595–597; the finite-descent argument in §10.26 | The rational or torsion-quotient statements are not substituted for the integral target. The prime-to-prime detection step retains possible 2-torsion. |
| Dual numbers | van der Kallen 1971, pp.1204–1207; Dennis–Stein 1973, Remark 3, p.286; Weibel Ex.III.5.14(c), p.230 | The general module `M_R` is retained. Its identification with absolute differentials requires 2 invertible. |

I did **not** read the primary texts of Dennis–Stein 1975,
Maazen–Stienstra 1977, Keune 1978 or Loday's 1978 relative paper. The
first two were checked through the expressly authorized secondary sources;
the latter comparison through the explicit published accounts above. I did
not read an uncleared copy of Milnor or Gille–Szamuely. Their inherited
citations are not presented as fresh primary-source verification. In
particular the accessible alternatives and the own arguments, rather than
an assertion about an unseen proof, are the basis for this verdict.

For reproducibility, the following public copies were accessed on 2026-10-20:

| Copy | SHA-256 |
| --- | --- |
| [Weibel, K-book](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf) | `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845` |
| [van der Kallen–Maazen–Stienstra announcement](https://webspace.science.uu.nl/~kalle101/maazenStK.pdf) | `e49902aa8f4fe4edb2abb84a00e93d571207b9439f6782a59f5dd3e55e4d506b` |
| [LNM 342](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf) | `cb73e6fc75fe941510b8999176b1c952d0d088b4f599d16d0b9b77ba8de15b55` |
| [van der Kallen 1978](https://webspace.science.uu.nl/~kalle101/GeneratorsRelations.pdf) | `3fae71df1b32b1f12076b8d10b57c41222d45c56e3e4508e3b7e61a16320cbd4` |

The random sample was selected before editing: Python's
`random.Random(11348).sample` on the 139 subsection headings. These are the
fifteen sampled sections, with the checked accessible locators:

| Section | Locator and result |
| --- | --- |
| 13.10 | Weibel Ex.III.5.14(a), p.229: radical-contained ideal and differential formula agree. |
| 10.7 | Weibel Ex.III.7.5, p.257: degree-one transfer is the field norm. |
| 6.8 | Weibel III.5.10.3–4, p.226: fixed the unnecessary complementary-unit assumption. |
| 10.33 | Bass–Tate Part II, Theorem 2.1(3), p.396, proof pp.397–402: fixed the unsupported supplier edge. |
| 8.1 | Loday §§2.1–2.2, pp.335–340; Waldhausen pp.342, 375–376; Weibel 1981 pp.503–505: conventions checked independently of the admitted Lean statements. |
| 6.1 | Weibel III.5.2.2, p.218, and III.5.10, pp.225–226: commuting images and centrality are essential. |
| 5.7 | Weibel III.7.1, p.245, and III.6.1, p.231: the two specified degree-two quotients agree. |
| 13.11 | Weibel Ex.III.5.14(b), p.230: corrected the page and supplied a nonzero kernel detector. |
| 12.3 | Weibel III.6.5, p.236, and V.6.8, p.412: the sequence includes the terminal SK₁ map. |
| 5.4 | Weibel III.7.1, p.245: the quotient is two-sided and has degree zero `ℤ`. |
| 11.8 | Weibel V.6.1.2 and V.6.6, pp.406, 409–410: tracked the inverse tame convention through the comparison. |
| 7.2 | Weibel III.6.1, p.231, and III.7.1, p.245; Matsumoto Cor.5.11, pp.30–31: the native symbol map, not only an abstract isomorphism, is identified. |
| 6.16 | Weibel III.5.10.5, p.226; Steinberg §6; Moreno Ramírez Theorem 4.3.22, pp.108–109: added the accessible finite-rank locator. Milnor's book was not read. |
| 8.2 | Weibel IV.1.10.1, p.266; VI.4.3.2, p.482, and VI.5.2.1, p.488: specified degree three in the non-surjectivity Check. |
| 10.24 | Weibel III.7.6.1, p.249, proof p.250: arbitrary finite extensions and transitivity, including inseparability. |

## Adversarial mathematical pass

The table covers every numbered subsection, including its API, displayed
identities and Checks; ranges group closely related statements. I also checked
the standing conventions, supplier contracts, layer examples and dependency
paragraphs. A retained row means the stated hypotheses survived the tests,
not that a finite calculation proves the general theorem.

| Statements | Instances and failure modes checked | Result |
| --- | --- | --- |
| Conventions; 1.1 | Unnormalised bar differential on `[a|b]-[b|a]`; Heisenberg matrices over `𝔽₃`; trivial group | Lifted boundary is inverse commutator, with coordinates 2 versus 1. A coefficient action must be the induced action. |
| 2.1 | Zero row/column, rank three, noncommuting coefficients in the reverse row formula | Column multiplication is on the left; row change is `-v_i a` on the right. Faithfulness uses matrix entries, not transition injectivity. |
| 2.2–2.3 | Common larger finite rank; central finite kernel versus an arbitrary finite rank | Stable centrality does not supply finite-rank centrality. The stated injectivity hypothesis is retained. |
| 3.1–3.2 | Distinct auxiliary indices, zero root parameter, ranks 3 and 5 | Normalized lifts and uniqueness use the rank bound. Universality over the elementary group still needs a central kernel. |
| 3.3 | Kernel inclusion, positive/negative bar choices | The Hopf calibration is explicit rather than an unspecified isomorphism. |
| 4.1 | Simply connected cover, trivial ring kernel, Hurewicz direction | The composite uses inverse Hurewicz and the cover map in the declared order. |
| 4.2–4.3 | Identity/composite ring maps; nontrivial basepoint tracks | The fibre normalization is separate from the Hurewicz route; naturality uses tracks or trivial fundamental-group action. |
| 4.4–4.5 | Different plus models; zero path component versus all K₀ components | Claims concern transported maps, not literal equality across carriers. No representative of a nonzero component is needed. |
| 5.1–5.2 | Zero pairing, constant-one non-example, complementary units, `𝔽₂` | Bilinearity and the specified relation span give the universal quotient; no exterior-square relation is imposed. |
| 5.3 | `a=1`, characteristic 2, real `{-1,-1}` | Skew-symmetry permits nonzero diagonal 2-torsion. |
| 5.4 | Empty symbol, one symbol, complementary adjacent entries | Degree zero is `ℤ`; degree one is the additive unit group. Ring quotient is two-sided. |
| 5.5–5.7 | Degrees 0, 1 and 2; multiplication on either side of a relation | Homogeneity and the degree-two relation module are actual quotient comparisons. |
| 5.8–5.10 | Identity/composite embeddings, repeated entries, real sign pairing | Functoriality and permutation signs do not imply integral alternation. |
| 5.11–5.12 | `𝔽₂`, `𝔽₃`, cyclic unit group; degrees 0, 1, 2 | Vanishing begins in degree two. The finite-field argument keeps the odd-exponent alternative. |
| 5.13–5.14 | Divisible torsion groups, degree two, characteristic-p roots | Tensor and relation divisibility are both needed for unique divisibility of the quotient. No false torsion-free assumption is introduced. |
| 5.15 | Positive entry versus all-negative symbol, degree one | `D_n` and the sign summand split in degrees `n≥1`; `{-1,…,-1}` has order two. |
| 6.1 | Identity lift, different central lifts, noncommuting elementary images | Star product requires commuting images; lift independence uses centrality. |
| 6.2–6.3 | Parameters 1 and -1, rank-three matrix shadows | Weyl and diagonal words have the stated inverse and diagonal entries. |
| 6.4–6.6 | Two different diagonal supports; toral defect and commutator | The normalization is fixed before the Matsumoto adapter; unrelated lift choices cannot change a central commutator. |
| 6.7–6.9 | Integers at `r=-1`, `r=1`, reals at `r=-1`, characteristic 2 | Corrected §6.8. The Steinberg complementary-unit hypothesis is not transferred to the negative-unit identity. |
| 6.10–6.11 | Identity monomial matrix, signed transposition, zero root parameter | Monomial kernel is central; the whole kernel is not silently assumed monomial over a general ring. |
| 6.12–6.13 | Rank three, finite fields, symbol inverses, diagonal normal form | Symbol generation concerns the monomial kernel over a commutative ring. |
| 6.14–6.15 | Zero upper entries, rank-three cross term, zero/nonzero Bruhat branch | Lexicographic coordinates are recovered successively; the nonzero branch uses invertibility in a field. |
| 6.16–6.17 | `𝔽₂`, `𝔽₃`, reals; quotient by toral defects | Finite-field kernels vanish without a universal-centrality claim. Added the nonzero real toral-defect Check; Bruhat reduction does not assert uniqueness of both unipotent factors. |
| 6.18 | Semilocal rings with small residue fields; division-ring warning | Unit-symbol generation is retained for commutative semilocal rings, without a residue-size restriction. |
| 7.1–7.3 | Complementary pair, real diagonal, identity/composite field maps | The explicit native comparison preserves symbols; an abstract Matsumoto isomorphism alone would not suffice. |
| 7.4–7.5 | Leading coefficients at infinity; finite subextension supporting a class | Rational-function restriction splits; the general field-extension kernel is torsion, not asserted zero. |
| 8.1 | Oriented torus, inverse commutator, `{2,t}` over `ℚ(t)` | Raw Hurewicz normalization has numerical sign `ε=-1`; inversion defines the product normalization. |
| 8.2–8.4 | Degrees 0, 1, 2, 3; `ℚ` in degree three | Corrected the ambiguous degree. The degree-three image and indecomposable quotient are distinct. |
| 9.1 | Unit, uniformizer, inverse uniformizer, `0` excluded from the domain | Unit part has order zero; changing the uniformizer changes unit parts. |
| 9.2–9.4 | In `ℚ₅`, `(2,5)`, `(5,2)`, `(5,5)` and `(5²,5)`; negative orders in `(1/5,4/5)` | Tame values are respectively 2, 3, 4, 3; the complementary pair has residue 1. All denominators are units or nonzero field elements. |
| 9.5–9.8 | Unit/uniformizer pair, swapped entries, ramified embedding | Normalization is `∂{u,π}=ū`; valued embeddings contribute the ramification exponent. |
| 9.9–9.10 | Degree-zero coefficient, `Π²`, negative-order Steinberg branch | Serre's algebra keeps `Π²={-1}Π`; deleting this term would fail. Both component maps are checked with their grading; added the explicit inverse-uniformizer value for d_t. |
| 9.11–9.12 | Pure-unit symbol, uniformizer first/last, degree zero | Residue and specialization are different maps. The kernel statement is about the specified Serre map. |
| 9.13–9.16 | Constant rational functions, repeated valuations, `π↦uπ`, degrees 1 and 2 | Residue has finite support and is uniformizer independent; specialization is not. First/last position contributes `(-1)^(n-1)`. |
| 9.17–9.18 | Prime equal to residue characteristic; degree zero; ramification index zero excluded | Rigidity requires the prime-to-residue-characteristic condition. Ramification uses normalized nontrivial discrete valuations. Removed process wording. |
| 10.1–10.2 | Constants, degree-one polynomials, equal-degree cancellation | Leading coefficient supplies a retraction; degree reduction decreases the corrected filtration. |
| 10.3–10.5 | One monic prime, zero residue class, degree one | Section is on a filtration quotient; finite-support Bass–Tate exactness does not choose a global compatible section. |
| 10.6–10.7 | Linear polynomial, degree-zero class, degree-one unit | Transfer is defined using the residue lift and infinity sign; low degrees give degree and field norm. |
| 10.8–10.10 | Base-field entries on either side, degree one, projective line | Projection formula and restriction-transfer multiplication use the stated ordering; the infinity contribution has its sign. |
| 10.11–10.14 | Purely inseparable prime step, normal prime-degree step, prime-to-prime extensions | Restriction detection only cancels integers prime to the chosen torsion prime. Generator independence is not assumed in constructing a simple transfer. |
| 10.15–10.18 | Equal characteristic, ramified mixed characteristic, imperfect residue field, Artinian tensor factor | Completeness and finite normalization supply the lattice; component lengths remain in base change. No local-compactness assumption is substituted. |
| 10.19–10.21 | All four unit/uniformizer positions; characteristic 2; norm of a uniformizer | The residue sign and residue-field norm agree without an extra ramification multiplicity. |
| 10.22–10.24 | Identity tower, two prime steps, inseparable tower | The commuting square proves generator independence and transitivity rather than using them circularly. |
| 10.25 | Nonreduced tensor product in an inseparable base change | Length multiplicities cannot be dropped. |
| 10.26 | Every torsion prime, including 2; finite Sylow descent; purely inseparable steps | The finite descent kills the discrepancy integrally. It does not infer integral equality merely by cancelling 2. |
| 10.27 | Several primes above one valuation; inseparable finite extension | Finite integral closure is an explicit hypothesis. Completion factors and residue norms produce the sum without an additional `ef` multiplier. |
| 10.28–10.29 | Finite inseparable constant fields, degree one, degree two | Curve/place dictionary is imported; the integral higher reciprocity target is retained separately from Suslin's torsion-quotient intermediate statement. |
| 10.30–10.31 | Overlapping versus disjoint divisors; constant function; total divisor evaluation | Evaluation equality requires disjoint supports. The library's total evaluation outside its unit-at-support condition is not used as a theorem. |
| 10.32–10.33 | Number field with no real places; `𝔽_q(t)`; algebraic union of function fields | Corrected the function-field supplier. Vanishing is for `n≥3`; finite symbol data descend to a global function subfield. |
| 11.1–11.2 | Unit/uniformizer and swapped entries; Dedekind prime | The localization boundary is compared with the chosen inverse convention explicitly. |
| 11.3–11.4 | Degrees 1, 2, 3; finite-support sum | Signed boundary is `(-1)^(n-1)` times the last-entry residue. A direct-sum homomorphism needs finite support. |
| 11.5 | Uniformizer replaced by a unit multiple | Two product specializations are not silently identified with each other or with a uniformizer-independent map. |
| 11.6–11.8 | Norm on degree one, degree two and swapped unit/uniformizer | Raw comparison has the recorded minus sign; product normalization gives the stated degree-two square. |
| 12.1 | Empty valuation family, repeated valuations, full family | Unramified group is an intersection of actual kernels; finite character is a hypothesis for total residues. |
| 12.2–12.4 | Empty S, enlarged S, a prime inside versus outside S | Two localization sequences have different index sets. Terminal SK₁ maps remain. |
| 12.5 | Two negative units, one positive unit, `{-1,-1}` | Real sign detects the integral class and does not annihilate every diagonal. |
| 12.6 | Auxiliary two-index relation, zero coefficient, rank three | Auxiliary integer word group is not misidentified with a rank-two Steinberg group. |
| 12.7 | All seven peak cases; zero/equality boundary; both signs | Recomputed matrix identities for the nontrivial three-coordinate cases. Strict decrease is checked at every new intermediate vector. |
| 12.8–12.9 | Identity word, peak of height one, signed permutation | Word reduction puts the integer kernel in the monomial subgroup before symbol generation is invoked. |
| 12.10–12.11 | Real detector, reduction mod 4, residue at 2 and an odd prime | Upper order bound and nonzero detector give `K₂(ℤ)=ℤ/2`; rational decomposition uses residues with the declared convention. |
| 13.1 | `r=0`, `s=0`, one entry a unit, dyadic pair `(-1,-2)` | Admissibility is `1-rs` a unit. Modern/published convention dictionary has no spurious inverse. |
| 13.2 | Every displayed pair in D2 and D3, zero entry | Relations are imposed only on admissible pairs, including the transformed pair. |
| 13.3–13.5 | `𝔽₂`, `𝔽₃`, `𝔽₄`, local rings with those residues | Threefold stability over a field is cardinality at least four; the all-local presentation is not deduced from threefold stability alone. |
| 13.6 | `ℤ/4`, `ℤ/9`, split characteristic-p dual numbers, `ℤ_(p)`; nonliftable pair mod 5 | Corrected the lifting Check and stated the published small-residue DVR input. The residue-isomorphism hypothesis is an isomorphism, not merely an embedding. |
| 13.7 | `I=0`, `I=A`, cross generators, double projections | Relative group is the double quotient. Cross classes are killed before identifying its K₂ kernel with a fibre group. |
| 13.8 | Split radical pair, nonsplit `ℤ/4→𝔽₂`, nonradical pair | Corrected the published comparison input. The split argument and general double-excision theorem remain distinct. |
| 13.9 | `I=0`; `I=5ℤ`; D3 triple `(x,y,x+y)` over `𝔽₃[x,y]/(x²,y²)` with `I=(xy)` | Guard is on inputs. Output-only guard produces a nonzero differential defect. Split radical injectivity is the published input; generation retains the radical hypothesis. |
| 13.10 | `D(ε,t)` and reversed order; both entries in I; all D2/D3 guards | Differential values are `dt`, `-dt`, and zero respectively; corrected combined page locator. |
| 13.11 | `ℚ[ε]`; `ℚ(t)[ε]`; `ℚ[x,y]/(x,y)²` | Added explicit Checks. Determinant detector gives `D(x,y)≠0` with zero differential target, even with 2 invertible. |
| 13.12 | Square-zero ideal, `ℤ/4`, dual numbers with and without 2 invertible | Simplified relations are not claimed to identify every square-zero relative K₂ with differentials. |
| 13.13 | `R=ℤ`, `𝔽₂`, `𝔽₂(t)`, `ℚ(t)` | General `M_R` retains F-relations; only the 2-invertible specialization becomes ordinary differentials. Corrected p.230 locator. |
| 13.14 | All admissible pairs and triples in `ℤ/4` | Parity detector satisfies D1–D3 and separates `(3,2)` from `(1,2)`; its two Lean examples are proved. |
| 13.15 | `n=1`, `n=2`, arbitrary `n≥2` | Dyadic statement begins at `n=2`; finite-field case `n=1` is zero. Survey §12, p.255, agrees. |

Two additional finite calculations were used only as sanity checks. For the
four nontrivial three-coordinate peak cases in §12.7, enumerating coefficients
in `[-8,8]` and both signs produced 1,616, 1,224, 1,368 and 1,168 admissible
instances; all matrix identities and all strict intermediate height bounds
passed. For the new determinant detector over
`𝔽₃[x,y]/(x,y)²`, all 405 guarded D1, 8,019 guarded D2 and 13,851 guarded D3
instances passed, with detector value 1 on `(x,y)`. The README supplies the
algebraic argument over `ℚ`; these finite checks are not its proof.

Every defining subsection has at least three discriminating prose Checks,
including degenerate cases and a wrong plausible construction it excludes.
The added tests specifically protect against integral alternation, mistaken
unit lifting, and deleting the square-zero kernel. Heavy constructions stay
as README targets with their APIs; the closing Lean comment identifies those
not expressible on carriers available at the pins.

## Ownership, packet fidelity and current upstream audit

The packet inventory has 240 nodes in fourteen files. Overlapping refinements
are consolidated rather than repeated. T.1 and its three supplements feed the
supplier boundaries and Layers 1–4 and 6; T.2 and its two supplements feed
Layers 5–8 and §§10.32–10.33; T.3 and its three supplements feed Layers 9–12;
T.4 supplies the detailed integral transfer and reciprocity arguments of Layer
10; T.5 supplies §§6.10–6.16; T.6 supplies Layer 13. The old Galois, Brauer,
Hilbert, Tate and étale-Chern targets in T.3/T.6 belong to
K2SymbolsBrauerPartII under the maintainer's explicit split, not to this
package. Generic universal extensions, stable Steinberg theory, field
Matsumoto and finite-field classical K₂ are imported from their named owners.
The native tensor quotient comparison and finite-rank refinements retained
here state how they differ from those suppliers.

I read current ClassFieldTheory and AlgebraicVectorBundles as full-form
models, checked AlgebraicCurves and the quadratic-invariant boundary, and
searched the current roadmaps, Completed roadmaps and current Tau Ceti
library by mathematical objects and hypotheses. This included the nine
roadmaps newer than the atlas snapshot. Current Tau Ceti contains the used
valuation/divisor interfaces and low-degree K₀ material, not the retained
Milnor quotient, relative Dennis–Stein presentations or higher reciprocity
targets. LocalFieldsRamification's local-field assumptions do not supply the
arbitrary complete DVR statements with imperfect residue field. No additional
target had to be removed for duplication during this review.

I also read the relevant contracts at these current supplier PR heads as data:

| Supplier | Upstream PR | Head |
| --- | --- | --- |
| AlgebraicKTheory | #1142 | `4c951ced56bd5eaeae86ca3d2a474c503cc3ab40` |
| GeneralAlgebraicKTheory | #1212 | `57056743b0997d5f46fa8bca5f67b50d075c30bc` |
| StableHomotopyKTheory | #1227 | `8b81fab0d6464d52bbe253bd9fd7f1ee5345efa5` |
| KTheoryLowDegrees | #1248 | `ca13fbfca5661ff3d15a1e197418df521a782d2f` |

Their relevant README/Suggested contracts contain no dependency back on this
package. In particular GeneralAlgebraicKTheory §10.12 supplies isomorphisms in
nonpositive degrees and a degree-one surjection, not the degree-two input in
§13.8. KTheoryLowDegrees §§13.3–13.5 supply the classical low-degree maps and
signed prism convention. No retained prerequisite takes
K2SymbolsBrauerPartII, MotivicEtaleKTheory, K3BlochGroups, ArithmeticKTheory
or RefinedTraceMethods as supplier; their appearances are ownership or
downstream-consumer statements. The unsupported function-field
ClassFieldTheory edge was removed as described above. No notion was moved to
another owner by this review.

At the pinned sources I read, in particular, the trivial-coefficient
`groupHomology.H1AddEquivOfIsTrivial`, the noncommutative group direct-limit
construction, `PiTensorProduct.isEmptyEquiv` and `subsingletonEquiv`,
`TensorPower.mulEquiv`, the normalized factor-set extension and its induced
action criterion, the section/cohomology equivalence hypotheses, valuation
order multiplication and uniformizer decomposition, and divisor principal
and evaluation interfaces. The group-homology equivalence really has a
tensor factor for general coefficients; the factor-set criterion concerns
the induced action; divisor evaluation needs units on the support. The README
does not silently discard any of these conditions.

## Lean reconciliation and checks

The unchanged Suggested.lean has real-bodied light definitions, fifteen
admitted theorem statements, and ten proved examples. It has no sorry-bodied
data, no auxiliary theory development and no admitted example. There are at
most two examples per kept definition. All fifteen theorem signatures were
compared with the README, exceeding the required ten:

| Lean statement | README and hypotheses checked |
| --- | --- |
| `symbol_swap`, `symbol_self` | §§5.2–5.3: field, unit inputs, additive quotient; no alternation. |
| `symbol_neg_one_neg_one_real` | §5.9: nonzero real diagonal. |
| `subsingleton_symbolGroup_of_finite` | §5.11: finite field, degree two. |
| `existsUnique_lift_of_isSteinbergPairing` | §§5.1–5.2: arbitrary additive abelian target and all pairing axioms. |
| `MilnorK.symbol_perm` | §5.10: integral sign, arbitrary list including the empty list. |
| `MilnorK.symbol_eq_zero_of_finite` | §5.12: list length at least two. |
| `tameUnit_mem_unitGroup` | §§9.1–9.2: nonzero unit inputs, surjective discrete valuation. |
| `tameUnit_mul_left` | §9.4: genuine units, no assertion about a zero field input. |
| `tameUnit_steinberg` | §9.4: complementary unit values and surjective valuation; residue-one conclusion. |
| `weil_reciprocity_of_disjoint` | §10.31: function-field hypothesis and disjoint actual divisor supports. |
| `K2.isThreefoldStable_field_iff` | §13.3: field cardinality at least four, including infinite fields. |
| `K2.dennisSteinGroup_equiv_symbolGroup` | §§13.2, 13.4: field and admissible pair, generator normalization specified. |
| `K2.closure_relDSRelFirst` | §13.9: arbitrary ideal, no unnecessary radical condition for the guard equivalence. |
| `K2.subsingleton_relDennisSteinGroup_bot` | §13.9: zero ideal, arbitrary commutative ring. |

Validation completed:

- `lean-check` on the package Suggested.lean exited 0 at Mathlib
  `082e2d37e8` / the shared pinned Tau Ceti build: exactly fifteen
  `declaration uses sorry` warnings, no errors or other warnings. Available
  memory was checked before elaboration. No language server or Lake build
  was started.
- `scripts/check_sorry_data.py` exited 0.
- `scripts/check_blueprint.py` on each of the fourteen packet files exited
  0, each reporting zero errors and zero warnings. Legacy packet gap fields
  are unchanged; these schema checks are not the mathematical verdict.
- `research/blueprint/intake.py check-files` passed for the deliverables and
  handoff, with zero problems.
- `git diff --check` passed.
- Metadata remains exactly `topic = "math.KT"`.

No unresolved mathematical defect remains from this review. The source-access
limits above are recorded explicitly; under this issue's published-theorem
rule they do not require a further decomposition job. The maintainer can
proceed with the draft upstream package, preserving the supplier ordering and
the Part II boundary.
