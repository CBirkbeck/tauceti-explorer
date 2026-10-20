# Independent package review: higher local fields and higher class field theory

Issue #10903; reviewer Codex, session `codex-Ip3k8Q`; 20 October 2026.
The package was written by a different session, `codex-Q7PvOA`.

**Verdict: needs_changes.** This is a completed fixing review. The mathematical
corrections below are applied. Several external prerequisites still lack an
exact supplying target of the required scope; naming the requirements does not
make the package ready for an upstream draft. No target was deleted to conceal
those dependencies, and no accepted packet was edited.

## Corrections applied

1. **Rank principal units (§1.4).** Defined `V_F=1+m_rank` and its generated
   Milnor subgroup separately from the outer-depth filtration. Specified its
   quotient image without silently replacing it by an outer-unit closure.
   The symbol `{1+u,t}` in `F_q((u))((t))` belongs to the rank principal part
   but has nonzero outer residue and so is outside outer `U^1`. The one-local
   equality supplies the boundary control. Added the three rank-unit API names
   to the README and the Lean closing inventory. Sources: Invitation I §1.1,
   p.7; §6.3, p.64; §6.5, p.66; §7.2, p.76.
2. **Actual symbol suppliers (Scope, contracts, §2.6).** The accepted MEK
   differential-symbol targets and its package §§7.4–7.6 already include BGK,
   the prime-power Witt symbol on an independent étale carrier, arbitrary
   imperfect fields, and continuity. Removed the contrary assertion about
   its M.5d layer. Invertible norm residue is MEK §6.6. Purely inseparable
   invariance is used only for coefficients prime to p. Mapped K2's old stage
   shorthand to its actual package Layers 5, 9, 10 and 11, including the full
   transfer and proper-curve exports in §§10.24–10.29. This removes a spurious
   unowned generic BGK obligation; the mixed-DVR comparisons remain separate.
3. **Geometric supplier scope (contracts, §§2.3, 5.4, 6.5, 7.4).** Replaced
   assertions that SF.2 already supplies scheme fundamental groups/purity and
   EDC.2–3 already supplies arithmetic étale homology/niveau theory by explicit
   additional requirements. Distinguished CR.4.8's actual logarithmic sheaves
   and exact sequences from missing trace/residue comparisons. Distinguished
   KLF §5.2a's odd-prime universal absolute complex from its perfect-residue DVR
   calculations. Removed the nonexistent `PrimeToDegreeAlterations` direction
   name and stated the global degree-controlled contract itself.
4. **Auxiliary field in inverse reciprocity (§3.4).** Parameter independence is
   over the fixed field Σ, using the purely unramified extension `LΣ/Σ` and
   transitivity of norms. It is not a statement that arbitrary parameter
   changes in F give the same wild norm class. Added the example
   `β^p−β=t^(−1)` over `F_p((t))`: the length-one residue pairing of `1+t`
   is 1, so it is not a norm. Source: Invitation I §10.1, p.96, with §6.4.3,
   p.66 for the residue pairing.
5. **Surface differential (§6.5).** Replaced a circular square-zero Check by
   the computed contributions `+χ` and `−χ` along the two coordinate flags
   on `Spec F_7[u,t]_(u,t)`, with nonzero `χ∈H¹(F_7,ℤ/3)`. Their sum is zero;
   retaining only one flag fails. The general proof still requires the actual
   niveau differential, rather than using the example as a proof.
6. **Primary extensions (§6.6).** Primary means separable algebraic closure of
   k in K, rather than relative algebraic closure. The latter unnecessarily
   excludes `F_p(s)⊂F_p(s^(1/p))(t)`. Added that check and avoided asserting
   geometric reducedness. This reconciles the carrier with §6.8's full primary
   theorem. Source: Jannsen Theorem 0.4, pp.2–3. DP §2 uses a sufficient
   narrower subcase and does not justify narrowing Jannsen's theorem.
7. **Real places and cone signs (§6.9).** Removed the unnecessary totally
   imaginary/odd-prime restriction: KS Theorem 8.3, p.172 includes all places
   and ℓ=2 over number fields. Retained the real-place degree-zero term
   `H²(ℝ,ℤ/2(1))=ℤ/2`, the archimedean duality conventions, and the arithmetic
   shift. Added the two-step cone computation
   `d²(0,x)=(d_D f(x)−f(d_C x),d_C²x)=0`. The minus sign is now witnessed.

Items 6–7 broaden two previously restricted formulations in accordance with
the maintainer's generality rule. The accepted packets retain their original
wording because this job cannot change them. No generic BGK theorem is
replanned here; only the higher-field comparison squares remain local targets.

## Remaining defects and exact resumption points

| Ref | Consumers | Missing input and required resolution |
| --- | --- | --- |
| R1 | §§2.5–2.6, 2.7; §§4.4–4.5; wild §§5.4, 6.5, 6.8, 7.4 | Resolve the additional finite-length DVR residue/trace, logarithmic purity and mixed-DVR comparison requirements in their imperfect-residue/all-prime scope to precise exports. CR.4.8 supplies logarithmic sheaves and étale exactness; MEK supplies the field symbol isomorphism and §7.4's mod-p norm/trace comparison. Those existing assertions are imported. KLF §5.2a is odd-prime universal existence, and its explicit calculations use perfect residues. None of these assertions alone supplies the claimed mixed-wild comparison. An extension of the owning directions, with the exact maps and hypotheses, is needed. |
| R2 | §§2.3, 5.4, 6.2–6.5, 6.8–6.9, 7.4 | Resolve the actual finite-étale-cover Galois category and `π_1^ab(U)`, the needed scheme purity, and arithmetic étale homology with field stalks and niveau `d_1` to exact geometric targets. SF.2's field étale/Galois comparison and henselian points do not supply the first two. The EDC package explicitly scopes its main six-operation theory to finite-type schemes over fields and defers general absolute purity/trait extensions; it contains no supplied arithmetic niveau construction. EDC Part II's local absolute-purity vanishing target is narrower than this full contract. Do not replace the niveau construction by the assertion that residues square to zero. |
| R3 | §§6.8–6.9 | Supply a proper regular alteration of generic degree prime to the chosen ℓ, with the compactification and transfer descent used in Jannsen Theorems 2.10–2.11, pp.24–25. No `PrimeToDegreeAlterations` package/direction exists in the checked inputs. Accepted EDC Part II `EQ.2/prime-to-ell-local-uniformization` gives regular SNC covering families; `EQ.0/standard-form-covers` refines covers. Neither statement as written asserts a single proper regular alteration of the required global form. Provide the missing deduction or an exact stronger supplier, rather than relabelling ordinary de Jong alterations. |

These defects were exposed and qualified in place, but not discharged. Closing
them entails extending or resolving other owners' targets, beyond this job's
editable files. The accepted packet's 15 recorded obligations and 27 requests
are still present. In particular, Kato's full character argument, topological
norm descent, Zhukov interpolation/normalization, primary adelic exactness and
scheme existence remain mathematical work to be planned/proved as specified;
this review does not certify those proofs as complete.

There is also an upstream ordering limitation: HL is outside the 94-roadmap
Caraiani–Newton order, as are several suppliers. No tier or bundle was invented.
The maintainer must supply an applicable ordering before the package can be
certified to use only existing, same-bundle or lower-tier roadmaps. This is
recorded separately from the concrete missing contracts R1–R3.

## Coverage, form and libraries

Read WORKERS, PACKAGE_REVIEW, PROTOCOL (including closure, sources, tests,
suggested-file and package rules), expansion PROTOCOL and UPSTREAM_GUIDE.
The two snapshot README models were Multiquadratic and LocalFieldsRamification;
current LocalFieldsRamification and Completed/RestrictedProducts signatures and
supplier sections were also inspected for topology and restricted-product form.
The package keeps its summary, boundaries, conventions, contracts, eight ordered
layers, Examples/Dependencies pairs and references. All 85 accepted targets,
139 original API items and 101 original construction/definition Checks were
walked; the corrected Checks strengthen rather than remove their intent.
All 33 accepted definition/construction nodes have at least three Checks.
The three added rank-principal API entries are README-only heavy interfaces.
Metadata remains the single line `topic = "math.NT"`.

Read the reviewed HL.0–HL.7 library audit. Read all 45 baseline declaration
statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and the supplied
Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` build. These comprise:

- Scheme/Galois-category carriers; adic completion; Dedekind/DVR/local-ring and
  residue-field carriers; finite adeles, number-field adeles and restricted
  products; local fields, p-adics, power/Laurent series, perfect rings,
  profinite groups, uniform completion, Witt vectors/Frobenius and valuations.
- The native Laurent valuation/completeness and coefficient-bound theorem;
  all six Hahn coefficient/single/extensionality declarations; open additive
  subgroups, nonarchimedean groups, additive/group filter bases, neighborhood
  basis, commutative filter-basis construction and the singleton/discrete test.
- Tau Ceti's continuous-cochain zero map, place ramification group and ordinary
  unit filtration.

Important boundaries were checked by statement, not just name: the Laurent
valuation bound uses `exp(−D)`, completeness is outer-adic, the DVR class
excludes fields, and abstract `GaloisCategory` does not construct scheme π₁.
The light definitions do not assume multiplication is jointly higher-continuous.

Duplication search used the supplied current read-only roadmaps at
`0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including all nine newer roadmap
directions, all four Completed directions and OperatorTheory subdirectories.
Searches covered mathematical objects and hypotheses: towers and successive
residues, two-sided coefficient growth/decay, higher and sequential topologies,
Milnor quotients and transfers, logarithmic Witt and Kato coefficients,
ramification matrices/ferocious extensions, explicit symbols, Parshin flags,
recursive adeles, class groups and global-place complexes. No kept higher-field
target was found already supplied there. The nearby modules
`TauCeti/RingTheory/Huber/LaurentSeries.lean` and
`TauCeti/RingTheory/Huber/Restricted/TwoSidedSeries/Basic.lean` were read directly:
the former is outer-adic; the latter requires cofinite coefficient decay in
both directions. Positive coefficients constantly 1 distinguish `E{{T}}`.
No duplicate target removal or move-down was necessary. Ordinary reciprocity,
ramification, cohomology and restricted products remain boundary imports.

## Source verification

Downloaded the seven public PDFs already cited by the package and checked their
versions/hashes. Read the numbered statements, surrounding hypotheses and the
relevant comparison arguments. No source text or extracted passage is committed.
The package author's proof-reading limitations are not treated as evidence of
proof completion. In particular, reopening a survey theorem does not extract its
original proof. Morrow Theorem 4.17, p.30 explicitly lacks a published proof in
that survey; its comparison stays a proof obligation.

The independent random sample was selected from all 85 nodes by
`random.Random(10903).sample(nodes, 15)`, before mathematical edits. The list
below is the full sample, including repeated source locations; it was not
replaced by fifteen convenient distinct pages. All locators resolved.

| Sampled target | Source opened; result |
| --- | --- |
| Kato complexes and boundary square zero | KS Definitions 1.1–1.2, pp.129–132, (8.1), pp.169–170; Jannsen (4.1)–(4.4), pp.40–43; DP §2, pp.4–5. Niveau origin and grading confirmed. |
| Nonreal local cd bound | DP §2, pp.3–5, Proposition 3.2, p.7. The local-constant compositum is the bounded nonreal field, not arbitrary global K. |
| Extensions/ramification matrix | Morrow Definition 2.23, p.15, Proposition 2.28, p.16; Invitation I §1.2, p.8. All residue degrees, including inseparable ones, are retained. |
| Higher-topology basis specification | Invitation I §1.3.1(a), p.9, §1.3.2, p.11. Tail freedom and topology distinction confirmed. |
| Pro/ind finite objects | Invitation, Kato existence §1, pp.165–171, Proposition 2/Lemma 2. Categorical finite objects differ from finite underlying point sets. |
| Iterated residue/signs | Invitation I §6.4.1, p.65; Morrow §5.1, pp.32–34. Last-slot boundary normalization confirmed. |
| Vostokov/wild existence | Invitation I §8.3, Theorems 1–2, pp.85–87, §8.4, p.87. Odd-prime restriction and sign ambiguity confirmed. |
| Higher adeles | Morrow §8.1, A1–A4/Remark 8.3, pp.53–55; §8.2, Lemma 8.4, p.55. Recursive order of operations confirmed. |
| Unramified acceptance | Morrow Theorem 5.8(ii)–(iii), pp.34–35. Degree map/Frobenius normalization confirmed. |
| Strictly coarser higher topology | Invitation I §1.3.1(a), p.9, §1.3.2, p.11. Nondiscrete coefficients are essential. |
| Higher idelic/cycle input | Kerz §4, Definitions 4.2–4.3, p.5; §5, Definition 5.2, p.6; §6, Definitions 6.1–6.3, pp.7–8. Q-chain omission and modulus relations confirmed. |
| Scheme global reciprocity | Kerz §5, p.7, §9, Theorems 9.1–9.2, pp.14–15. Source arithmetic/real-place restrictions retained. |
| Higher equals outer iff discrete | Invitation I §1.3.1(a), p.9, §1.3.2, p.11. The discrete coefficient boundary gives the converse witness. |
| Restriction/corestriction | DP §2, p.4; Jannsen Theorem 2.10 proof, pp.24–25. Degree multiplication, not identity, is the descent input. |
| Two-dimensional residue pairing | Invitation I §6.4.3, p.66, §5.2, p.56. Degree, shift, trace and parameter order confirmed. |

Also reopened the sources underlying the author's flagged proof obligations:
classification/Epp summaries (Invitation I §§1.1,17.1, pp.6–7,144; Morrow
Theorem 2.18/Remark 2.19, pp.13–14); topology comparison (Morrow Theorem 4.17,
p.30); Kato existence/characters (§§1,5, pp.165–171,191–194); differential
symbols and finite-length pairings (Invitation I §§2.4,5–8, pp.25,55–56,61–87);
inverse reciprocity (§10, pp.95–100); Zhukov (§17, pp.143–150); Kurihara (§9,
pp.91–93); adelic exactness (Morrow §§8.1–8.3, pp.53–60); the Kato/niveau and
Hasse arguments (KS §§1,8, pp.129–132,169–174; Jannsen pp.2–3,24–25,40–43,
48–50; DP §2, p.5); Milne I.2, pp.38–39. The independent original
Cohen/Epp, Beilinson/Huber, Kato–Saito and full weights proofs have not been
re-extracted by this review; the README correctly retains the required inputs.

| Source version | SHA-256 |
| --- | --- |
| Invitation, published MSP volume | `a6c9088000d9b18ded4d2159531d7544683b86d6eecdbb2ab6cc9b743baabe62` |
| Morrow, arXiv:1204.0586v2 | `c996cd77420a87bc1b657d7216f71f659f343cffe26046d171fade0eecf8b141` |
| Kerz, arXiv:0907.5337v3 | `616fd1b1ce373cd9c5990228e4cce4248aac2c3f7fceb1ea6f6b2050db5d48d5` |
| Kerz–Saito, PMIHES 115 (2012) | `f4bb5f8b378c148f4b458b964f78761156255396e1bade5d7a11717fef2689e7` |
| Jannsen, Annals 183 (2016) | `26dde9260f6475e4f6acbfbe651e18fac0d443a5f318fbf3974efc9f809f7d71` |
| Milne, Arithmetic Duality Theorems, second edition | `2c6195ec76a974f3f336c77cb71cc3845b018aad2d43136716b3477a3bc5fb31` |
| Dittmann–Pop, arXiv:2012.01307v2 | `f9f26f7d8d6b5cb6bf86d04bf97f8f99069d8d676623cebe706e90ea8dcb2c1f` |

## Adversarial pass over every accepted target

Each row records an instantiated check of the statement and its subsidiary API,
in addition to reading the package's original Checks. A passing instance is not
a proof. Requirements R1–R3 still apply to the affected rows. Common conventions
include `n=0` only where defined, `m≥n` for iterated Milnor residues, positive
coefficient lengths, finite end fields, last-slot residues, arithmetic Frobenius,
and the distinct outer/rank/sequential/profinite topologies.

| Accepted target | README | Instance, result and disposition |
| --- | --- | --- |
| `HL.0/n-dimensional-local-field` | §0.1 | n=0 gives the finite field itself; a one-step tower identifies its residue with that finite field, not another chosen local field. Retained. |
| `HL.0/local-parameters` | §0.2 | In `F_3((u))((t))`, t has outer valuation 1 and u is an outer unit. `(t,u)` fails. Retained. |
| `HL.0/rank-valuation-ring` | §0.3 | `u^(−100)t` has positive rank value while `u^(−1)` is outer integral but rank negative. Rank and outer rings differ. Retained. |
| `HL.0/standard-mixed-series` | §0.4 | Coefficients 1 in every positive degree are allowed; coefficients 1 in every negative degree fail decay. Read against the current restricted-series carrier; no duplication. |
| `HL.0/classification-and-standard-fields` | §0.5 | n=1 has no extra Laurent/mixed parameters; the mixed-transition two-local case allows a finite extension of a standard subfield, not automatic equality. Retained. |
| `HL.0/higher-topology` | §0.6 | In equal series a box is unrestricted at sufficiently positive indices; in mixed series a common valuation bound and eventual containment replace eventual equality. Retained. |
| `HL.0/extensions-and-ramification-matrix` | §0.10 | The residue-inseparable degree-p example has outer e=1; the remaining residue-tower factors account for p. No separability assumption inserted. |
| `HL.0/teichmueller-representatives-and-expansions` | §0.11 | In `ℚ_3`, `1+1=2` is outside `{0,1,−1}`. Multiplicative representatives are not an additive coefficient field. Retained. |
| `HL.0/two-dimensional-examples` | §0.12 | Rescale `β^p−β=u/t^p` by γ=tβ; the reduced equation is `γ̄^p=u`, witnessing inseparable residue without inseparability upstairs. Retained. |
| `HL.0/topology-on-the-multiplicative-group` | §0.13 | For `ℚ_p((t))`, pullback identifies `1+t` with 1 topologically; the graph topology separates them. Separate conventions retained. |
| `HL.0/perfect-and-quasi-finite-variants` | §0.14 | An algebraically closed terminal field is perfect but has trivial Galois group, not the chosen procyclic generator. The extra hypothesis remains. |
| `HL.0/pro-ind-finite-objects` | §0.15 | Depth zero is the finite-set field object; `F_q((u))` is not made finite by representing it in an ind/pro category. Retained. |
| `HL.0/coefficient-box` | §0.7 | All coefficient subgroups equal to top gives every series; a monomial at −1 detects a proper subgroup at that index. Retained. |
| `HL.0/coefficient-box-membership` | §0.7 | The forbidden coefficient at −1 excludes the series even when every nonnegative coefficient is zero. All integer indices are quantified. |
| `HL.0/coefficient-box-single` | §0.7 | At exponent j=−2, only U_(−2) tests the monomial coefficient; the zero coefficient always passes. Retained. |
| `HL.0/coefficient-box-intersection` | §0.7 | A coefficient in U_j but outside V_j fails the intersection. Pointwise infimum has the required carrier. Retained. |
| `HL.0/coefficient-box-tail` | §0.7 | With threshold N, the monomial at N is included, while one at N−1 can be excluded. The endpoint is inclusive. |
| `HL.0/coefficient-filter-basis` | §0.8 | Two thresholds N and M give threshold max(N,M); a constant proper family has no threshold. Retained. |
| `HL.0/coefficient-filter-basis-membership` | §0.8 | A strict superset of a box is a neighborhood but need not itself be a member of the named box family. Retained. |
| `HL.0/equal-characteristic-higher-topology` | §0.9 | The zero translate recovers each generating box and arbitrary translates give neighborhoods of their centers. Native outer topology is kept separately. |
| `HL.0/higher-topology-basis-specification` | §0.9 | Intersection of two translated neighborhoods at a point is refined by a translated box; basis equality is stronger than merely declaring boxes open. Retained. |
| `HL.0/higher-topological-add-group` | §0.9 | Each box is closed under addition and negation; its product with itself maps into itself. No field-multiplication instance follows. |
| `HL.0/higher-neighborhood-basis` | §0.9 | The whole space is a neighborhood via the all-top box; a neighborhood may contain a box strictly. Retained. |
| `HL.0/open-subgroup-boxes-cofinal` | §0.9 | Each coefficient neighborhood can be refined by an open subgroup under the stated nonarchimedean hypothesis; this is not asserted for arbitrary archimedean K. |
| `HL.0/higher-coefficient-continuity` | §0.9 | Restrict U_j alone and leave all other U_i top, for j negative as well as positive. This gives the inverse-image neighborhood. |
| `HL.0/higher-single-induced-topology` | §0.9 | The coefficient at j is a left inverse to the j-monomial embedding; its induced topology must be the supplied coefficient topology. Retained. |
| `HL.0/higher-hausdorff` | §0.9 | A nonzero coefficient separates a nonzero series only when coefficient neighborhoods separate that value from zero. T2 remains explicit. |
| `HL.0/higher-versus-outer-topology` | §0.9 | Every admissible box contains an outer tail. Reverse ordering of topologies gives `outer ≤ higher`, not the other inequality. Retained. |
| `HL.0/higher-equals-outer-iff-discrete` | §0.9 | For finite discrete K the coefficient boxes recover outer balls; equality in the other direction forces the constant copy of K to be discrete. |
| `HL.0/higher-strictly-coarser` | §0.9 | Over `F_p((u))`, constants u^j tend higher to zero but stay outside the outer degree-one ball. The nondiscrete hypothesis is essential. |
| `HL.1/iterated-residue-with-signs` | §1.1 | `{u,t}` has integer residue +1 and `{t,u}` has −1; in degree n+1 a finite-field unit survives instead of an integer. Retained. |
| `HL.1/norms-and-projection-formulas` | §1.2 | A terminal degree-d extension gives multiplication by d on K₀ under norm; restriction in higher degrees still has the terminal field-restriction map. Retained. |
| `HL.1/topological-milnor-k-groups` | §1.3 | Degree zero stays discrete ℤ. In the prescribed characteristic-zero pullback convention the positive outer principal unit can disappear in degree one. Retained. |
| `HL.1/parshin-structure-of-the-topological-k-group` | §1.4 | q=2 removes tame factors but not the integer component; n=2 needs rank principal units to accommodate `{1+u,t}`. Definition corrected. |
| `HL.1/filtration-on-milnor-k-groups` | §1.4 | `∂_t{1+u,t}={1+u}≠0` separates rank units from outer U¹. In n=1 the corresponding K₁ subgroups agree. Corrected with additional Checks. |
| `HL.1/acceptance-computation-of-an-iterated-residue` | §1.5 | `δ{a,u,t}=a` while switching u,t gives a inverse in the multiplicative finite-field target. Additive/multiplicative signs agree. |
| `HL.1/topological-versus-algebraic-k-groups` | §1.6 | The integer class 1 survives modulo 2; quotienting by a divisible kernel does not replace ℤ by its profinite completion. Retained. |
| `HL.2/finite-kato-coefficient-complex` | §2.1 | n=1 coefficients give the zero complex; in characteristic p the degree-i logarithmic sheaf remains shifted by −i. Retained. |
| `HL.2/kato-cohomology-groups` | §2.2 | q=1 is the character group; q=2 has twist one and recovers Brauer classes, including the wild coefficient interpretation. Retained. |
| `HL.2/restriction-corestriction` | §2.2 | Odd degree acts invertibly on 2-primary torsion; degree two can kill a class. No unconditional injectivity inferred. |
| `HL.2/low-degree-identifications` | §2.2 | A one-local invariant is on H², not H¹. Positive characteristic does not turn its Brauer group into zero by using μ_p. Retained. |
| `HL.2/kato-residue-theorem-and-the-invariant-map` | §2.3 | A two-local tower has invariant in degree 3; restriction scales by total extension degree and corestriction preserves the invariant. Wild proof inputs remain explicit. |
| `HL.2/cohomological-dimension-and-tate-twists` | §2.4 | For `ℚ_p((t))`, bottom one-local characteristic is zero, so ℓ=p is not excluded merely because a lower residue has characteristic p. Retained. |
| `HL.2/norm-residue-and-the-symbol-identification` | §2.6 | Degree zero is ℤ/p^s; degree one over `F_p(t)` detects t, whereas its pth root extension kills the mod-p source class. Actual MEK export substituted. |
| `HL.2/logarithmic-de-rham-witt-coefficients` | §2.5 | `F_p((u))` is imperfect and CR's field carrier applies; KLF's perfect-residue explicit DVR calculation does not. Scope clarified; R1 remains. |
| `HL.2/finite-coefficient-duality` | §2.7 | The characteristic-p tower has infinitely many Artin–Schreier characters, so blanket finite cardinality is false; the finite-group prime range and character-duality claim stay distinct. |
| `HL.2/two-dimensional-residue-pairing-acceptance` | §2.8 | A constant trace-one character on `{u,t}` gives +1/m; exchanging u and t negates it. Retained. |
| `HL.2/nonreal-local-cd-bound` | §2.4 | `ℚ(t)` is formally real; the finite bound is for its nonarchimedean local-constant extension, not for its global ordinary cd₂. Retained. |
| `HL.3/reciprocity-map` | §3.1 | A positive ordered parameter symbol maps to arithmetic Frobenius on the terminal constant extension; inversion would fail this test. Retained. |
| `HL.3/isomorphism-theorem` | §3.2 | L=F gives the zero quotient/trivial group; a degree-d constant extension gives ℤ/d. Finite quotient and absolute targets remain distinct. |
| `HL.3/parshin-reciprocity-in-characteristic-p` | §3.3 | At n=1 the Witt character agrees with the function-field Artin normalization; the parameter/constant-character test fixes the sign. Retained. |
| `HL.3/artin-schreier-trees-and-the-explicit-construction` | §3.4 | The auxiliary extension `LΣ/Σ` is unramified; a wild extension over F need not norm `1+t`. Qualified the parameter Check and added the computed failure over F. |
| `HL.3/existence-theorem` | §3.5 | L=F corresponds to the full group. Increasing L decreases its norm subgroup; categorical finite-index openness is not replaced by the non-Hausdorff raw pullback. Retained. |
| `HL.3/kernel-and-completion-statements` | §3.6 | The unramified ℤ direction maps densely to ℤ̂ but is not onto before completion. Absolute injectivity is into the full abelian Galois group. Retained. |
| `HL.3/unramified-acceptance-case` | §3.7 | Degree 1 gives the trivial quotient; degree d maps δ=1 to the Frobenius generator modulo d. Retained. |
| `HL.4/higher-tame-symbol` | §4.1 | For residue q=2 the root group has order 1, so the symbol is trivial; at odd q, `{π,π}` has residue −1. Retained. |
| `HL.4/explicit-formulas-for-the-hilbert-symbol` | §4.1 | A coefficient power in any entry kills the symbol. A parameter and unramified character distinguish arithmetic Artin from its inverse. Retained. |
| `HL.4/vostokov-pairing-and-the-wild-existence-case` | §4.2 | p=2 is excluded by the formula. S is divided in the lifted series ring before evaluation, where its value is zero. No 0/0 or assumed arithmetic sign. Retained. |
| `HL.4/ramification-filtrations-and-their-indexing` | §4.3 | i prime to p gives the source's breaks i, i/p and i/p² in the respective examples. A group element at equality fails the strict lower bound. Rational interpolation remains required. |
| `HL.4/kurihara-exponential-and-differential-forms` | §4.4 | q=1 has scalar domain and zero maps to the neutral unit. In q=2 the T-residue of `{exp(ηa),T}` is exp(ηa), although T is an outer unit. Retained. |
| `HL.4/artin-schreier-witt-acceptance-computation` | §4.5 | At length one, `t^(−1)(du/u)∧dt/(1+t)` has iterated residue 1; a Frobenius coboundary pairs to zero. Lifted rather than componentwise Witt operations remain required. |
| `HL.5/parshin-chains` | §5.1 | A finite terminal point supports the higher-local conclusion. `Spec ℚ` has no such terminal finite residue and is excluded from that assertion. All singular branches retained. |
| `HL.5/higher-adeles` | §5.2 | Empty chain set gives zero; on a field the singleton gives that field; on a curve integrality at almost all points excludes the unrestricted product. Retained. |
| `HL.5/adelic-resolution` | §5.3 | For a curve the two-term complex has generic plus integral local pieces in degree zero; flasqueness alone does not imply augmented exactness. Retained. |
| `HL.5/residue-maps-along-a-flag` | §5.4 | A nodal specialization has both normalization branches. Removing either changes the sum/transfer and can destroy cancellation. Stronger geometric supplier remains R2. |
| `HL.5/higher-idelic-and-cycle-complex-input` | §5.5 | Inserting the omitted penultimate point of a Q-chain ranges over all completions/branches. Modulus zero and positive modulus impose different relations. Retained. |
| `HL.5/nisnevich-class-group-comparison` | §5.7 | Zero modulus reduces to the ordinary Milnor sheaf; positive modulus is a relative kernel, not the same sheaf relabelled. The Gersten/purity comparison is explicit. |
| `HL.5/functoriality-and-direct-images` | §5.6 | Identity finite map gives identity pushforward; on a curve a finite extension gives the idele norm, with the terminal degree factor. Retained. |
| `HL.5/acceptance-recover-ideles-and-list-surface-flags` | §5.8 | Dimension one recovers ordinary finite adeles; a surface has seven nonempty index types, with different restrictions at 01, 02, 12 and 012. Retained. |
| `HL.6/reciprocity-relations` | §6.1 | Complete branch sums cancel in the two-flag coordinate case; a partial branch list need not. Proper-curve reciprocity is imported from K2, not reproved here. |
| `HL.6/global-reciprocity-for-arithmetic-schemes` | §6.2 | Closed-point generators map to Frobenius; finite-modulus quotients are the finite comparison objects, not an assertion that the raw class group is profinite. R2 remains. |
| `HL.6/wiesend-class-group` | §6.3 | The connected component is in the reciprocity kernel; quotienting by it differs from taking a profinite completion of an arbitrary group. Retained within source hypotheses. |
| `HL.6/tame-and-wild-proper-and-open-variants` | §6.4 | At residue characteristic p, deleting pro-p inertia changes the wild target to the tame one. Proper unramified and open modulus targets remain distinct. |
| `HL.6/reduction-of-the-curve-case` | §6.4 | For `Spec O_K`, local units map to inertia and must be quotiented to compare finite ideles with the unramified scheme target. Retained. |
| `HL.6/kato-complexes-and-boundary-square-zero` | §6.5 | Computed nonzero ±χ surface residues cancel. At degree zero the term is H¹, whereas the preceding curve term is Brauer H². Replaced circular Check; R2 remains. |
| `HL.6/constant-place-fields` | §6.6 | For K=k(t), constants extend to k_v(t), not k_v((t)). Purely inseparable algebraic constants are allowed by primaryness. Corrected and tested. |
| `HL.6/resolution-f2` | §6.7 | A degree-p alteration is not birational; a smooth compactification with singular boundary fails the independent SNC clause. Both requirements retained. |
| `HL.6/lgp-global-base` | §6.8 | ℓ=2 over a number field includes real places; finite-coefficient injectivity needs the preceding divisibility/Bockstein input. Exact alteration prerequisite remains R3. |
| `HL.6/lgp-good-model` | §6.8 | Characteristic-zero generic field with residue characteristic 2 fails this branch's assumption. The good-model argument cannot be invoked from generic characteristic alone. Retained. |
| `HL.6/lgp-characteristic-two` | §6.8 | d=4 carries the two-clause resolution hypothesis; d≤3 uses separate unconditional inputs. Ordinary étale μ₂ would erase the logarithmic group. Retained. |
| `HL.6/kato-hasse-global-models` | §6.9 | Over ℚ at ℓ=2 the real H² term is nonzero. Arithmetic cone degree a is D_a⊕C⁰_a; the two-step differential fixes its sign. Broadened to KS's full scope. |
| `HL.7/dimension-one-artin-map-comparison` | §7.1 | On the common n=1 carrier, a uniformizer maps to arithmetic Frobenius for both maps; a normalization-free isomorphism would not suffice. Retained. |
| `HL.7/brauer-invariant-comparison` | §7.2 | At n=1 the invariant is the ordinary Brauer invariant, with restriction degree and corestriction trace matching. The equality is on an identified coefficient carrier. Retained. |
| `HL.7/finite-duality-comparison` | §7.3 | `ℚ_p((t))` permits ℓ=p in the stated bottom-characteristic range. The order of the cup and terminal trace is fixed, not a free choice of perfect pairing. Retained. |
| `HL.7/motivic-residue-comparison` | §7.4 | `{u,t}` maps under the outer boundary to `{u}` in both theories. Reversing entries negates it; a μ_p Kummer square cannot replace wild logarithmic purity. Supplier scope corrected. |

## Lean signature audit and checks

Both independent `lean-check` invocations exited 0. The final file has 210
lines, three real-bodied light definitions, five proved examples (at most two
per definition), eleven theorem targets and eleven `declaration uses sorry`
warnings only. There is no admitted carrier, data instance, example or auxiliary
theory construction. Only the closing README inventory changed in Lean.

| Signature | README match / adversarial condition |
| --- | --- |
| `coefficientBox` | §0.7; every integer coefficient, additive subgroup, genuine body. |
| `IsAdmissible` | §§0.8–0.9; eventual equality with top, rather than bounded negative support. |
| `higherTopology` | §0.9; topology generated by all translated admissible boxes, explicitly named. |
| `higher_isTopologicalAddGroup` | §0.9; additive continuity only, over any supplied coefficient topology. |
| `mem_nhds_zero_iff` | §0.9; containment of a box, not equality with a box. |
| `continuous_coeff` | §0.9; nonarchimedean coefficient hypothesis present, all integer j. |
| `induced_single` | §0.9; exactly the original K topology on the monomial copy. |
| `higher_t2` | §0.9; explicit T2 hypothesis. |
| `outer_le_higherTopology` | §0.9; Mathlib's reverse topology order is correct. |
| `higherTopology_eq_outer_iff` | §0.9; discreteness is the criterion, not finiteness or perfection. |
| `outer_lt_higherTopology` | §0.9; nondiscrete K supplies strictness. |
| `higherTopology_discrete` | §0.9; specializes the equivalence without changing the coefficient field. |
| `constant_sequence_higher_not_outer` | §0.9; convergence in K plus every term nonzero prevents eventual zero in the outer constant copy. |
| `outer_ball_not_higher_open` | §0.9; the degree-one outer ball cuts constants down to zero; nondiscreteness is present. |

Every README definition is either a real declaration above or represented in
the closing construction/interface list. Heavy higher-local, Milnor, coefficient,
adelic, reciprocity and Kato carriers are not forced into Lean through substitute
data. The new README examples require these heavy carriers and stay there.

Validation: final Lean exit 0, only the eleven sorry warnings; packet checker
exit 0 with 85 nodes, 139 API items, 101 original tests, 15 gaps, 27 requests and
zero closed stages; `intake.py check-files` on the six package/review/handoff
files (including unchanged metadata) exits 0; `git diff --check` passes. Elaboration does not establish
the eleven admitted statements or discharge R1–R3.

No source passage, private-library material or local filesystem path is in the
deliverables. No fetched instruction was followed or found suspicious. The
handoff contains all durable resumption information; disposable sources/logs
are unnecessary for the next worker.
