# Independent review of LanglandsParameterStacks

**Verdict: needs_changes.** Review job REV-LanglandsParameterStacks, issue #444; Codex session codex-vL7v0c, 7 October 2026. The original blueprint was submitted by Codex session codex-eWzdia under #767. This reviewer did not write that blueprint.

The mathematical statements have been checked against the public sources, and clear corrections are applied in the packet and suggested file. Acceptance still requires reconciling the reader with those corrections and the confirmed ownership decisions. Chapter X is assigned to ES2/ES3 by the primary independent verifier, whereas the reader and retained LP4 nodes assign it to LP4. Accepted paper fixes also assign general pseudocharacters and reconstruction to IHG, and reject a new RG2.6 owner for general invariant theory. G5 and G6 record these contradictions rather than declare them resolved.

The existing honest foundation gaps G1–G4 do not by themselves justify this verdict. The packet remains a complete **planning pass** at target granularity, with eight planned stages and no closed stage. Nothing is asserted formalised or promoted.

## Counts and checks

| Item | Reviewed result |
| --- | --- |
| Nodes | 89: 16 definitions, 10 constructions, 54 theorems, 7 comparisons, 2 lemmas |
| Per-node verdicts | 32 verified, 47 corrected, 10 unverifiable for ownership |
| New nodes | 0; clear closure repairs are direct imports or expanded target-level proof sketches |
| API items / tests | 140 / 91; every one of the 26 definitions and constructions has at least three tests |
| Planets | 34; at most six per stage, all names at most 60 characters |
| Baseline citations | 29 confirmed; four descriptions narrowed, none removed |
| Sources / excerpts | Six hashed public PDFs; 90 literal excerpts across all 89 nodes |
| Requests / gaps / restructuring proposals | 14 / 6 / 7 |
| Source findings | 10 confirmed, none rejected; six added by this review |

The packet's `review.checked` contains the individual justification for every node, including statements, conventions and proof restrictions. It is the detailed review ledger, not a name-search checklist.

`python3 scripts/check_blueprint.py research/blueprint/packets/LanglandsParameterStacks.json` reports zero errors and warnings. The source-issue fields also pass `scripts/check_errata.py` through an errata-v1 wrapper. Additional checks cover source hashes and normalised literal excerpts, API/test inventory coverage, unique review entries, dependency acyclicity, stage target coverage, planet limits and whitespace.

The suggested Lean algebraic prototypes elaborate using `lean-check` at Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`, with only 86 warnings for admitted proofs. This checks types, not proofs or test conclusions. The shared build lacks the `TauCeti.GroupTheory.FixedSubgroup` object file; its import and two point checks remain explicitly commented. Tau Ceti declarations were checked in source at `f790474821cf4256814db967cb154e7af3d0c369`; this is not a claim to have compiled the file against a complete Tau Ceti build at that pin. No library build or language server was started.

## Public sources and fidelity

The six downloads match the SHA-256 values recorded in both `sources` and `sourceVersions`. Each excerpt was checked against the extracted text with Unicode and whitespace normalisation; mathematical statements and proofs were read separately. Short excerpts alone cannot certify their surrounding hypotheses.

| Public source | Passages checked |
| --- | --- |
| [Fargues–Scholze, author-hosted Geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf) | VIII.1–VIII.5, pp.277–315; X introduction/X.1, pp.339–343; X.3, pp.348–350; IX.7 for the geometric degree convention |
| [V. Lafforgue, arXiv:1209.5352](https://arxiv.org/pdf/1209.5352) | Public v10, January 2018; §§10–11, particularly 10.8, 10.10, 11.3 and 11.7–11.10 |
| [Böckle–Harris–Khare–Thorne, published Acta copy](https://archive.intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf) | §§3–4, pp.10–24, including all cited proofs; Proposition8.3, p.53 |
| [Zhu, arXiv:2008.02998](https://arxiv.org/pdf/2008.02998) | Revised public 2025 version, §3.1, pp.31–36; Proposition3.7 and Lemmas3.9–3.12 |
| [Dat–Helm–Kurinczuk–Moss, arXiv:2009.06708](https://arxiv.org/pdf/2009.06708) | §4.1, pp.29–31, and Frobenius/model conventions |
| [Kurinczuk–Skodlerack–Stevens, arXiv:1611.02667](https://arxiv.org/pdf/1611.02667) | Public v3, August 2020; Definitions1.20–1.21, pp.8–9, and the surrounding odd-residual-characteristic classical-group scope |

The Mathlib/Tau Ceti library audit was read before checking coverage. The upstream ReductiveGroups and RepresentationTheory/RootSystems documents were read as the density and scope models. No audit entry containing an existing library construction was converted into a new implementation claim.

## Corrections applied

1. **Attribution and locators.** DHKM's fourth author is Gilbert Moss, not David Moss. The revised Zhu result is Proposition3.7, not Theorem3.7; both node locators and the source reading list are corrected.
2. **Frobenius and Weil–Deligne parameters.** LP0 uses geometric σ with σ⁻¹τσ=τ^q and degree one. Therefore conjugation by σ scales monodromy by q⁻¹, and the equation is q^{−deg(w)}. The ClassFieldTheory supplier fixes arithmetic Frobenius; its degree must be negated when transported to LP. The comparison now spells out this conversion. A GL₂ example with q=3, N=E₁₂ and F=diag(1/3,1) detects the reciprocal convention. Source E5 records the conflicting printed formula.
3. **Wild enhancements.** Restored KSS's quasisplit classical-group, odd-residual-characteristic and complex-coefficient hypotheses. A trivial wild parameter has trivial **dual component**, with its prescribed Weil projection; it is not the constant homomorphism into the whole L-group. Centralizer and enhancement tests are corrected accordingly. Admissibility and component-group enhancement remain explicitly absent from the compiled abstract-group prototype.
4. **Derived cochains.** The Weil perfectness/Euler-characteristic theorem now directly requests the continuous/condensed derived complexes from E5 presentability. Discrete `groupCohomology` and degreewise Tau Ceti continuous cohomology do not already supply those complexes.
5. **Algebraic invariants.** The Lean prototype no longer fixes an algebra under the abstract group of base-ring points. It equalises the supplied coaction and the map a↦a⊗1. For G_m/F₂ acting by scaling on F₂[x], scheme invariants are F₂, whereas G_m(F₂) is trivial and pointwise invariants are all F₂[x]. This additional test catches the former wrong definition. The geometric Hopf/coaction construction is still a supplier obligation.
6. **Stable centres.** The coherent exact stable Hecke datum produces π₀End(id_C), and Schur objects require π₀End(X)=L. Pinned ordinary `CatCenter` supplies only the ordinary shadow. The packet, API and missing-signature inventory now preserve this distinction.
7. **Positive-characteristic anchor.** BHKT4.5 maximises the dimension of a **minimal containing parabolic**, then minimises centralizer dimension and component count. The original packet and reader reversed the first optimisation. The corrected acceptance example compares trivial SL₂ tuples, whose minimal parabolic is a Borel, with irreducible tuples, whose minimal containing parabolic is SL₂. This correction does not certify a second general LP reconstruction owner.
8. **Derived unit fibre.** Expanded VIII.5.13's argument through the relative bar cone, its coherent colimit in the separated IndCoh quotient, bounded t-amplitude and the Borel-flag conservativity argument. General IndCoh/t-structure interfaces are requested from E5. The proof does not assume the derived fibre is classical. The tame relation proof now precedes wild-gerbe elimination rather than using that later step prematurely.
9. **Fixed groups.** In the component-order argument, the ambient twisted coordinate algebra has good filtration; the coherent quotient O(G/H′) has **finite good-filtration dimension**, not automatically good filtration. Expanded the fixed-induction equivalences using bar detection, cyclic simply-connected generation and central-character summands, including nonsmooth central kernels. The later good-kernel theorem is no longer assumed in its own prerequisite.
10. **Mapping approximation.** The defining objects are finite **bases equipped with Γ-torsors**, or finite discrete anima over BΓ. Total Γ-torsors can be infinite. The category-valued left Kan extension is not asserted to be a newly represented stack. Statements, API, tests and inventory are corrected.
11. **Highest-weight ownership.** Added direct requests through the registered parent of the already accepted `ReductiveGroupsIntegralRepresentationsPartII` candidate. Integral induced/Weyl modules, Kempf, Donkin–Mathieu, O(G) filtrations and finite coherent good-filtration dimension belong there. Current parent Layer9 only supplies pinned integral groups. RG2.6's structural extension does not become a competing highest-weight owner.
12. **Existing IHG inputs.** Read the actual IHG node statements and added eleven precise node imports. The reconstruction step and local character bijection now specialise the existing generalized-reductive reconstruction to H⋊Q; component idempotents enforce the prescribed Γ→Q projection. The trace comparison imports the determinant/trace and semisimple reconstruction theorems. Existing connected/profinite continuity statements retain their scope; their extension to twisted local Weil data is not silently assumed. Residual generic anchor/definition APIs and reader routing remain G6.
13. **Quotient étaleness.** BHKT3.11's Galois closure L is generally transcendental over the quotient function field K₀. The corrected proof uses its finite relative algebraic closure L₀/K₀, the image Galois group and the corresponding intermediate field. Only then does the SF.4 finite-Galois integral-closure criterion apply. Corrected the action and quotient points in the formal-slice proof as well; E9–E10 record the source defects.

Eight missing API items were added: condensed parameter extensionality/gauge, Weil–Deligne extensionality, invariant-algebra membership/inclusion/lift, the free tuple constructor and universal-bundle coefficient change. Existing algebraic signatures are used where available, with full enhanced signatures explicitly omitted under G3.

No helper-lemma expansion was made: this job is at target granularity. All node implementation statuses remain unchecked. Existing IDs whose parent stage had already been corrected by the planner are retained for reference stability.

## Pinned baseline ledger

Each of the 29 declarations was read at its recorded module and pin, including its hypotheses. The four descriptions marked **fixed** overclaimed what the declaration supplies; their citations remain valid after narrowing. In particular, none supplies an enhanced stable carrier, algebraic-group regularity or continuous derived cochains by its name alone.

| Declaration | Confirmed scope |
| --- | --- |
| Representation | Abstract group representations on modules |
| MonoidHom | Multiplicative homomorphisms, distinct from crossed cocycles |
| Subgroup | Ordinary subgroup carrier, not a group scheme |
| FreeGroup | Free group and universal property |
| RingHom | Ring maps; algebra-linearity is extra data |
| MvPolynomial | Polynomial algebras for equations |
| AlgebraicGeometry.Scheme | Ordinary schemes, not animated stacks |
| Module.Flat | Module flatness |
| RingTheory.Sequence.IsRegular | Regular sequences; no named lci carrier assumed |
| Algebra.Extension.H1Cotangent | Kernel of the naive cotangent differential, not the full complex |
| groupCohomology | Discrete abstract group cohomology |
| PrimeSpectrum.isHomeomorph_comap | **Fixed:** elementwise nil kernel and positive power lifting; no nilpotence of the whole ideal or automatic universal base change |
| CategoryTheory.Triangulated.TStructure | Ordinary triangulated t-structures |
| CategoryTheory.Idempotents.Karoubi | Ordinary idempotent completion |
| CategoryTheory.MonoidalCategory | Ordinary monoidal categories |
| CategoryTheory.Functor.Monoidal | Ordinary monoidal functors |
| CategoryTheory.CatCenter | **Fixed:** ordinary End(id), only a shadow of the stable π₀ target |
| Condensed | Condensed sheaf carrier |
| CondensedMod | Condensed modules; no automatic relatively discrete tensor comparison |
| Module.Free | Free modules; finite rank is an extra hypothesis |
| RootPairing | **Fixed:** pairing carrier and flip; no invariant degrees, highest weights or π₁ table |
| CoxeterSystem | **Fixed:** generators/relations carrier; no automatic invariant-degree or Coxeter-number table |
| TauCeti.ContinuousCohomology.continuousCohomologyFunctor | Degreewise TopRep→TopModule coefficient functor |
| CategoryTheory.PresheafOfGroups.OneCocycle | Nonabelian Čech cocycles; crossed-action cocycles need a separate bridge |
| SemidirectProduct | Group multiplication/projection/sections |
| Subalgebra | Subalgebra structure for the coaction equalizer |
| CommRingCat.Colimits.hasColimits_commRingCat | Ordinary commutative-ring colimits; equivariant/animated enhancement is additional |
| Equiv.Perm.cycleFactorsFinset | Nontrivial disjoint cycles; fixed one-cycles must be added |
| TauCeti.fixedSubgroup | Equalizer of an ordinary group endomorphism and identity; no smoothness/reductivity assertion |

## Confirmed red-team findings and boundaries

The primary verifier and both fixes documents were consulted, as were the accepted Kisin–Pappas/Kisin–Pappas–Zhou representation routes and the BHKT/Lafforgue/Paškūnas–Quast routes. All supplier stage descriptions were read; stronger requests are explicitly extensions, not claims about the current stage.

| Finding | Review result |
| --- | --- |
| geomlanglands/4 | Independent structural fixed-group reductivity/unipotent-finiteness inputs precede LP1. LP1 does not depend on its later LP3 application. Registration/verification remains G1. |
| /5 | Generic operators and relations stay in LP2:excursion-presentation; stable target corrected to π₀End(id). ES0 is the Bun_G application. |
| /6 | **Unresolved G5:** primary verifier expressly selects ES2/ES3. The planning issue repeats the discarded alternative; it does not establish an authoritative override. Eight retained Chapter-X/action nodes have unverifiable ownership. |
| /23 | Coarse quotients/closed orbits/all-prime geometric characters stay unconditional in excursion-presentation. Integral-invariants owns only good-prime algebra equality/cohomology/base change. Its GIT inputs must follow accepted field-level routes, not the rejected new RG2.6 GIT allocation. |
| /24 | Corrected to the existing accepted integral-representation Part II, with PA.1 retaining GL-specific bounds. |
| /25 | Group-agnostic mathematics and both continuity regimes are checked. The subsequent confirmed BHKT/3 repair chooses IHG.1 as the general owner; LP/GS import their specialisations. G6 records residual alignment. |
| /26 | One chosen Z[1/p] cocycle model, Z_l base changes; SR.6 imports it. No canonical framed integral-choice assertion. |
| /27 | SF.1 owns effective fpqc/ordinary quotient interfaces. The verifier does not assign stacky derived Perf to S.1. E5 requests are explicit foundation extensions, not duplicate theorems already supplied by S.1. |

G6 also records that current IHG general pseudocharacter/reconstruction nodes cite the entire LP3 stage. Their field-level inputs need finer unconditional LP nodes before this becomes the desired early reconstruction chain. Adding IHG imports does not certify that this cross-packet reconciliation is finished, and aggregate LP2→IHG.1 would create a cycle through semisimple-characters. This review does not edit other jobs' packets or the atlas.

## Source mistakes

Each finding has its own `review` object, confirmed by REV-LanglandsParameterStacks. Corrections are scoped to the recorded copies, not advertised as published errata. The author/source version records and primary version histories were checked for corrections.

| Finding | Locator and conclusion |
| --- | --- |
| E1 | Lafforgue proof11.10, p.145 of the recorded French arXiv copy: g∈G should be g∈H. Misprint, affects nothing. |
| E2 | BHKT p.14: a reductive group's Lie algebra is not always semisimple. G_m in characteristic three is a counterexample. False statement; the required centralizer smoothness theorem remains valid. |
| E3 | FS proofVIII.4.1, p.292: the square is commutative, not generally cartesian. A zero category with torus invariants provides a counterexample. The proof only needs commutativity. |
| E4 | FS VIII.2.2.1, pp.282–283: HH² is not generally Ext¹ of the cotangent complex. For Q[x,y], the latter vanishes and Hochschild degree two does not. The natural map is sufficient. |
| E5, added | FS VIII.2.4, p.282, versus VIII.1/IX.7: reciprocal Frobenius convention in the printed monodromy scaling. Use q^{−deg} for the geometric degree fixed here. |
| E6, added | FS VIII.5.1, p.294, repeated p.304: the induced-module index is a dominant **character**, not a cocharacter of the group being represented. |
| E7, added | FS proofVIII.5.15, p.303: an inner finite-order automorphism is induced by a semisimple element, which need not be regular. diag(−1,−1,1) in SL₃ has a non-torus centralizer. |
| E8, added | FS p.304: λ_μ lifts μ, not λ. The index and subsequent restriction identify the intended weight. |
| E9, added | BHKT proof3.11, pp.16–18: the quotient-field Galois argument needs the finite relative algebraic closure, not L itself. Affects the proof; repaired above. Already independently identified by the BHKT red team. |
| E10, added | BHKT proof3.13, p.18: the action point is (1,x), the quotient point is π(i(1,x)). Misprints, affects nothing. Already independently identified by the BHKT red team. |

## Required revision and orchestrator decisions

The reader `research/blueprint/readmes/LanglandsParameterStacks.md` is not an editable deliverable of #444; WORKERS limits edits to the issue's files. It therefore remains unmodified. The revision should regenerate it from the corrected packet and explicitly check these locations:

- Lines61/268/437/563: Moss attribution; line57 and derived comparison: Proposition3.7.
- Baseline discussion around lines84–95: elementwise nil kernel, root/Coxeter carrier limits and the stable-centre distinction.
- Line676: geometric Weil–Deligne scaling; lines1213/1284/1621: π₀End targets and Schur hypothesis.
- Line1451 and its proof: maximise the dimension of a minimal containing parabolic.
- Fixed-component proof around line1910: finite good-filtration dimension of the quotient.
- Lines2057–2086 and Chapter X's finite-torsor formulations: finite bases bearing torsors.
- Lines23/2238/2570/2614: the accepted representation Part II owns highest weights; general GIT is not a newly proposed RG2.6 owner.
- Lines2368/2618 and LP4's introduction: primary ES2/ES3 Chapter-X ownership, not the discarded alternative.
- Source-issue section: carry E5–E10 and the repaired BHKT quotient proof into the reader.

The orchestrator should apply the primary Chapter-X migration and update its stage targets, incoming references and reader together, or record a superseding authoritative allocation. It should align residual generic anchor/API nodes with the existing IHG owner, and assign the exact shared Haboush/power-lifting/finite-Q inputs along the already accepted routes. These are concrete ownership reconciliations; creating another general highest-weight, GIT or reconstruction roadmap would repeat the problem.

All other source and foundation refinements remain the precise G1–G4 obligations already described in the packet. Resolving those implementation prerequisites is subsequent work, not a reason to declare this independent review unfinished.
