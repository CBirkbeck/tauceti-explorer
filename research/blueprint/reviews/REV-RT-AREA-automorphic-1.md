# REV-RT-AREA-automorphic-1

Independent verification of all 41 findings for issue #1490.
Verifier: **Codex — codex-hjdg0j**, 2026-09-24. Red-team author:
**Claude Code — cc-39fac3**. This verifier did not produce the input red team.

**38 confirmed; 3 rejected (34, 36, 39).** Confirmation applies to the corrected
scope and repair in the reason, not to every claim or alternative in the input.
The JSON contains one decision per input finding; those reasons are reproduced below.

## Baseline and evidence

Repository baseline: `0e104881128890174db3843266431bef9f89ec43`.
Read every input finding and its report evidence, all parent-stage contracts in
the eight roadmaps, the AutomorphicFormsOnReductiveGroups and
CompletedCohomologyPartII scope text, and the relevant adjacent stage contracts.
Checked selected completed-cohomology and Gross–Zagier fine nodes, their review
qualifications, library-coverage records, restructuring owners/links and review
statuses, and the cited paper items/routes and acceptance decisions.
This is a complete verification of the 41 findings, not a claim to have read
all proofs, all eight READMEs, every decomposition node or every routed paper.

Assembled the snapshot read-only, including stage prerequisites, accepted links,
restructurings, promoted blueprints and fine decomposition nodes: 2608 stages,
7361 unique directed prerequisite/edge pairs. Tested reachability and reverse
paths, then tested the selected additions together. No added edge in the union
has a return path. This is a check against the current graph, not certification
of future stage splits or of every alternative fix in the red-team report.

The checked union has 35 currently missing edges. It includes optional coarse
suppliers whose final use depends on a split (for example AL.5→the p-adic L1,
AF.5→R18.3 and ET.6→AL.4); the finding reasons govern whether to add them.
Existing AL.3→R16.4, R02.1→CC.2 and CC.1→ALS.6 paths are preserved.
The contradictory R16.5→R16.4 repair, the unfounded MP.6→L2 import and
AF.1a→AF.1 (requiring a new algebraic prefix) are excluded from this union.

Pinned libraries: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
Read the positive declarations at those commits and checked each inspected file
against its pinned Git blob hash. Targeted full-tree searches for the missing
real-group, cubic-transfer, Lazard, Paley–Wiener, Kostant, neatness and
Siegel–Weil foundations did not supply the missing producer. Incidental names
in bibliography, finite-field theory, highest-weight projections or unrelated
flat-module results are not implementations of those targets. Negative searches
support the precise gaps below; they do not prove universal nonexistence.

## Combined repair constraints

- Keep one real-representation successor and one early algebraic relative-Lie
  cochain owner. Do not independently build real LLC in AL and AF, or make
  van Est depend on global Eisenstein continuation.
- Put the Paley–Wiener supplier before ET.1 and AS.6. Retain ET.1→AS.6 for
  shared orbital integrals, with weighted analysis still at AS.6.
- Move the perfectoid almost-comparison theorem to TC.2; keep CC.8's generic
  fixed-exponent tower adapter. Concrete Shimura instances belong with their
  geometry. Gee–Newton's patched-complex theorem does not close a general
  completed-cohomology chain-model gap.
- The proposed metaplectic Part II already imports MP.6 and GZ.5. Extract an
  independent Siegel–Weil foundation before its Gross–Zagier-dependent suffix;
  importing the whole Part II back into either consumer would be circular.
- Preserve characteristic-zero/splitting assumptions for Kostant and rational
  cohomology, integral unnormalized conventions for boundary Satake, compact
  analytic-group hypotheses for Iwasawa duality, and effective-action caveats
  for neat levels. None is an unrestricted theorem.
- Reject duplicate-owner allegations against CC.2 and ALS.6 where explicit
  generic imports already exist. ALS.3's cup-product compatibility does not
  assert multiplicativity of an unnormalized Hecke operator.

Accepted routes consulted include Chenevier–Taïbi20, Kaletha16, Boxer–Pilloni26,
Hansen–Kaletha–Weinstein22, Calegari–Dimitrov–Tang25, Calegari–Geraghty18/20,
Ichino–Prasanna23 and Gan–Ichino18. A proposed Part II in an accepted paper
route is not yet a proved or integrated supplier. In particular, the compact
Shimura comparison proposal must retain its scope, and the theta Part II's
upstream/downstream boundary must be split before reuse.
RS-07/08/13/14/24 are accepted; RS-04/09/21/23/33 are still unreviewed in this
baseline. Their proposals are evidence of intended ownership, not live edges.

## Pinned declaration checks

- [Mathlib/Analysis/MellinTransform.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/MellinTransform.lean): lines 80–104, 382–425.
- [Mathlib/Analysis/MellinInversion.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/MellinInversion.lean): lines 64–112.
- [Mathlib/Analysis/Calculus/ParametricIntegral.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/ParametricIntegral.lean): lines 243–307.
- [Mathlib/Algebra/Category/ModuleCat/AB.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/AB.lean): lines 12–35.
- [Mathlib/CategoryTheory/Limits/Final.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/Final.lean): lines 322–355, 295–323, 174–179.
- [TauCeti/Algebra/Homology/ShortComplex/Colimit.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Algebra/Homology/ShortComplex/Colimit.lean): lines 52–69, 224–260, 204–225, 70–105, 185–205.
- [Mathlib/MeasureTheory/Integral/Prod.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/Prod.lean): lines 380–397, 433–448, 20–52, 312–332, 100–105, 179–184, 342–347.
- [Mathlib/MeasureTheory/Integral/DominatedConvergence.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/MeasureTheory/Integral/DominatedConvergence.lean): lines 77–102.
- [TauCeti/NumberTheory/HeckeRing/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Basic.lean): lines 511–542.
- [TauCeti/NumberTheory/HeckeRing/GL2/Degree.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/GL2/Degree.lean): lines 32–67.
- [TauCeti/NumberTheory/HeckeRing/Degree.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Degree.lean): lines 93–118.
- [Mathlib/Algebra/Lie/Cochain.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Lie/Cochain.lean): lines 8–37.
- [Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean): lines 25–49.

These checks establish the conditional Mellin/Bochner tools, final-functor
colimit isomorphism, module AB5/exact-shape complex homology facts and Hecke
degree formulas actually cited. They do not establish automorphic estimates,
enhanced-derived colimit comparison or a Jacobi-form category. The reasons
below retain those application obligations.

## Decisions

### RT-AREA-automorphic-1/1 — confirmed (high)

Confirmed missing proof inputs, with a bounded repair. Tunnell (1981), printed pp.173–175, explicitly uses cubic base change for a possibly non-Galois cubic extension and GL3/GL2×GL3 automorphic theory; p.174 also names the Gelbart–Jacquet/JPSS input to Langlands's tetrahedral case. R17.4 supplies cyclic base change and iteration, and R16.5 only a GL2 converse theorem. Searches of the assembled stages and pinned libraries supply no general cubic-transfer or symmetric-square/converse producer. Add the non-normal cubic theorem and the required symmetric-square/GL3 proof leaves before R17.5, with AL.3 supplying the integral theory. Tunnell's announcement identifies these dependencies but does not prove the JPSS or Gelbart–Jacquet theorems. Their original proof interiors and the exact converse theorem remain acquisition/decomposition obligations. Do not claim that an arbitrary GL3 converse statement automatically specializes to the GL2 theorem: retain its separately checked twist family, growth, pole and archimedean hypotheses. The proposed AL.3-based prefix can precede both R16.5 and R17.5 without importing either consumer.

### RT-AREA-automorphic-1/2 — confirmed (high)

Confirmed. Jacquet, Archimedean Rankin–Selberg Integrals pp.2–4, uses the archimedean Weil group, attached GL1/GL2 representations and discrete series; Cogdell Lecture 8 pp.61–62 gives the classification and gamma-factor dictionary. Bernstein–Krötz pp.3–4,22,40 explicitly uses Casselman's embedding and the Langlands/discrete-series reduction in the globalization proof. AF.1 plans globalization but does not decompose those inputs; ET.6 is explicitly nonarchimedean. The accepted Chenevier–Taïbi and Boxer–Pilloni routes ask AF.1/AF.4 for additional real theory, whereas Kaletha's route carefully refuses to credit it to the basic stage. This is an unresolved implementation/ownership boundary, not a contradiction between mathematical theorems. Choose one AF real-representation successor after an algebraic/cochain prefix; move globalization there and import it into AL.2/3 and the GL2 dictionary. Do not implement both AL.1a and AF.1b as independent classification owners. AL.1 keeps Tate's rank-one factors; higher Weil-representation factors need the extension/dictionary. Keep discrete series modulo centre, rank conventions, limits and coefficient/parabolic-cohomology hypotheses explicit; do not interpret the compact-Cartan criterion as equality of real split ranks.

### RT-AREA-automorphic-1/3 — confirmed (high)

Confirmed, correcting the supporting route's scope. CC.5 and its accepted nodes use Lazard noetherianity, canonical topology and noncommutative grade/codimension; NE.0 is not reachable in the assembled graph, and L1/L4 do not provide the general compact analytic group theorem. Schneider–Teitelbaum v1 §3 pp.12–15 states left/right noetherianity and uses it in Proposition 3.1, Lemma 3.4 and Theorem 3.5. The accepted Calegari–Dimitrov–Tang item 'lazard' is actually a cohomology/exterior-algebra computation for powerful torsion-free congruence groups, not a proof of general noetherianity. It corroborates NE.0's direction only. Widen one foundational NE.0 prefix, importing the existing L1 completed-algebra carrier, to compact p-adic analytic groups with O the integers of a finite p-adic field. Separate noetherianity from Auslander regularity/global dimension: use a suitable open uniform subgroup and prove descent/comparison with its precise p-torsion assumptions. Link that producer to CC.5. Lazard/Venjakob original proofs remain undecomposed; a theorem for arbitrary profinite groups or arbitrary coefficient rings is not confirmed.

### RT-AREA-automorphic-1/4 — confirmed (high)

Confirmed. Arthur's survey §20 Theorem 20.4 (pp.118–119), §21 Theorem 21.4 (p.135), and §23 (pp.146–148) exhibit respectively the multiplier theorem, local normalizing factors/μ-function, and the trace Paley–Wiener target spaces used by invariantization. AS.2/6 do not give their source-level producers, and ET.1's unitary real cases are neither a general replacement nor an ancestor of AS.6. The accepted Hansen–Kaletha–Weinstein route assigns BDK to the proposed SmoothRepresentationsCharactersPartII; that is a pending producer, not an integrated theorem. Keep the local normalizing-factor theorem in AS.2 and create a single real harmonic-analysis supplier before ET.1 and AS.6. Together with finding 24, do not put that supplier inside the final AS.6 stage and then ask ET.1 to import AS.6: the ET.1→AS.6 orbital-integral import would cycle. The original CD/BDK/Arthur proof leaves are still required; this verification establishes their consumption, not those proofs.

### RT-AREA-automorphic-1/5 — confirmed (high)

Confirmed. Arthur §12, Lemmas 12.2–12.4 and the explanation on pp.65–66, supplies square-integrable pseudo-Eisenstein series, the inner-product formula with convergent M(w,λ), and decomposition by cuspidal data as inputs to continuation and the later spectral decomposition. No assembled stage states those preliminary results. AS.1 already uses M in its constant term, while AS.2 constructs it; AS.3 uses wave packets before AS.4 constructs them. Split the convergent-intertwiner and pseudo-Eisenstein prefix before continuation, retain normalization/continuation in AS.2, and define wave packets before their AS.3 identities (or move those identities after their construction). Do not identify the elementary cuspidal-data decomposition with AS.4's full unitary spectral theorem, or silently extend Arthur's Q formulation to all global fields.

### RT-AREA-automorphic-1/6 — confirmed (high)

Confirmed, with coefficient and splitting qualifications. Harder–Raghuram §§4.2.1–4.2.3, pp.25–27, uses the unipotent fibre/Lie-cohomology comparison and Kostant's decomposition over a splitting characteristic-zero coefficient field; Proposition 4.3 is unnormalized induction and retains component-group actions. ALS.4 has no AF cochain prerequisite in the assembled graph. AF.1a's continuous real-group van Est theorem alone is not the lattice/nilmanifold comparison. Reuse a single full Lie-cochain owner, add Kostant with dominant integral highest weights and split/extension-descent hypotheses, then the arithmetic lattice comparison and Hecke-equivariant stratum application at ALS.4. Coordinate the cochain owner with finding 29. Mathlib's low-degree Lie cochains do not supply either theorem. No integral Kostant decomposition or arbitrary characteristic-zero nonsplit highest-weight formula follows without additional work.

### RT-AREA-automorphic-1/7 — confirmed (high)

Confirmed. Rapinchuk Theorem 2.3 and Remark 1, p.12, explicitly isolates the local absence of proper finite-index subgroups and explains the Kneser–Tits/Tits-simplicity input in strong approximation. AA.4's graph reaches neither a producer for it nor RG2.4. Tau Ceti's Tits-system structure and function-field approximation do not supply this reductive local-group theorem. Add the characteristic-zero nonarchimedean result at the reductive-group owner and import it into AA.4; define G(E)^+ using rational unipotent radicals with the standard isotropic hypotheses. Retain the remaining global approximation proof, noncompactness and simple-connectedness conditions. Kneser–Tits plus weak approximation is not by itself a complete decomposition of that proof. The primary Tits/Platonov interiors and any equal-characteristic extension are still open source tasks.

### RT-AREA-automorphic-1/8 — confirmed (medium)

Confirmed. Cogdell Lecture 4 p.30 gives the GLn Fourier–Whittaker expansion; Lecture 5 pp.40–42 uses it in unfolding and constructs the equal-rank Eisenstein series from Schwartz functions, theta summation and Poisson summation (Proposition 5.4), with character-dependent possible poles. AL.3 has no such global producer; SR.5 is local and the existing GL2 expansion is downstream. Put the general expansion and the theta/mirabolic Eisenstein construction in an AL.3 prerequisite prefix, importing AF.3 cusp forms and AL.0. R16.4/5 specialize this one construction. Preserve unitary character/twist and pole/residue hypotheses; a universal simple pole at s=1 for every datum is not the statement.

### RT-AREA-automorphic-1/9 — confirmed (medium)

Confirmed. Cogdell Theorem 4.2, printed p.33, derives multiplicity one from the Fourier expansion and uniqueness. R16.4 precedes R16.5, where the expansion is currently planned; the reverse edge would cycle. AL.3 already reaches R16.4 through R16.2, so finding 8's general expansion prefix repairs this without a new backward edge. Otherwise move only the GL2 expansion earlier, retaining the R16.5 integral-model and converse-theorem comparisons. Do not equate ordinary multiplicity one with the separately required strong multiplicity-one theorem.

### RT-AREA-automorphic-1/10 — confirmed (medium)

Confirmed on the fully assembled graph. AL.2 lacks SR.3's contragredient/matrix-coefficient theory and both AL.2 and AL.3 lack AF.2/3 and AA.1/2. AF.3 supplies cusp forms and rapid decay and reaches AF.2, SR.3 and the adelic quotient measures. Add AF.3→AL.2; its existing AL.2→AL.3 edge supplies AL.3 transitively (a second explicit edge is harmless but unnecessary). Neither reverse path exists. The local nonarchimedean and archimedean inputs still require their own coefficient and globalization hypotheses.

### RT-AREA-automorphic-1/11 — confirmed (medium)

Confirmed. The assembled R17 chain reaches R16.3 but not R16.4–6; R17.3 explicitly needs strong multiplicity one and R17.5 explicitly invokes R16's converse theorem and the weight-one dictionary. Add R16.4→R17.3 and R16.6→R17.5, preserving the R16.5 converse producer. Both are acyclic. Tunnell pp.173–175 corroborates the automorphic representation/L-series input; the weight-one infinity-type dictionary must remain an actual theorem, not be inferred merely from finite-place matching.

### RT-AREA-automorphic-1/12 — confirmed (medium)

Confirmed. R18.3's comparison with GL2 and R18.4's definite/indefinite comparison name the global transfer supplied by R17.3, but the assembled graph has no path. Add R17.3→R18.3 (hence R18.4). RS-21 proposes this but is unreviewed and its link is not live. Keep the finite class-set construction before the transfer-dependent suffix if needed, and retain its integral/freeness hypotheses.

### RT-AREA-automorphic-1/13 — confirmed (medium)

Confirmed as an inaccurate consumer/interface claim and a missing AL import, with a boundary on algebraicity. AL.5 names Rankin families 'already' in AutomorphicPadicLFunctions, whose stages do not state that family; its assembled consumer is PS.1. AutomorphicPadicLFunctions:L1 explicitly imports local integrals/Whittaker theory but reaches only AL.0/1. Add AL.3→L1 and describe actual consumers. RS-13 assigns AL.5 the normalization interface; RS-14 preserves the Q modular-symbol period/algebraicity formula at ModularSymbolsPadicLFunctions:L1 and BSW's general-field cycle formula at AutomorphicPadicLFunctions:L1. Cite those instead of re-proving their special-value results, but do not erase any separately needed Rankin algebraicity theorem simply because a GL2 standard-value theorem exists. Make any AL.5→L1 edge conditional on its actual interface use, and avoid making AL.5 import L1 while simultaneously requiring L1 to import all of AL.5.

### RT-AREA-automorphic-1/14 — confirmed (medium)

Confirmed. R16.1's blanket 'sole owners' sentence misattributes Schwartz–Bruhat spaces; AL.0 explicitly constructs them and Fourier/Poisson theory. Its assembled closure contains no AL.0. The unreviewed RS-21 owner entry and links incorrectly credit AA.2; its adjacent adelic-carrier entry also conflates AA.0 product Haar measures, AA.1 adelic points and AA.2 quotient measures. Correct those owner records and add AL.0→R16.1, retaining AA.2 links for quotient measures. R16.2 and R16.4 then receive AL.0 transitively; no duplicate direct links are required solely for that reason. This is a correction to an unreviewed proposal plus current text, not evidence that RS-21 has already altered the live atlas.

### RT-AREA-automorphic-1/15 — confirmed (medium)

Confirmed. The accepted CC.8 node includes the almost-O_C automorphic-section comparison, whereas the parent stage reserves that theorem to TC. Scholze v2 Theorem IV.2.1, pp.69–70, explicitly uses the perfectoid minimal compactification, strongly Zariski closed boundary, torsion comparison, limit comparison and almost purity for trace; those are not supplied by CC.8's graph. TC.2 is the matching downstream comparison owner and already imports CC.8 and TC.1's perfectoid geometry. Move this theorem, with the dependent dimension/vanishing corollaries now provisionally under CC.7, to a TC.2 suffix. Keep the fixed-exponent compact-support convention and generic-object identification in CC.8. Preserve Hodge type, chosen embedding, tame level, almost coefficients, pullback and trace, and the separate inverse limit in n. The existing decomposition review read the theorem's proof but explicitly left its imported proofs unread; do not misreport the theorem proof itself as unread or claim the Hodge–Tate map is used by IV.2.1.

### RT-AREA-automorphic-1/16 — confirmed (medium)

Confirmed only for the unprovided concrete instances in CC.8/CC.0. Their prose calls for actual modular, Siegel, unitary and Hilbert canonical-model comparisons, but the assembled graph supplies only the arithmetic locally symmetric prefix. R31.1, by contrast, explicitly specializes the generic CC object and imports R14.3/R18.4; it is not an independent generic completed-cohomology construction. Prefer repair (b): make CC.8 a parameterized transport/localization adapter for a supplied finite-level comparison, and prove the modular/quaternionic and Hodge-type instances in R31.1 and TC.2 with their geometric inputs. This matches the existing scope paragraphs and avoids making the generic tower depend on every Shimura construction. If concrete instances remain in CC.8, add their exact suppliers. The report's absolute claim that no general Betti–étale comparison owner exists is too strong: the Ichino–Prasanna extraction already proposes ShimuraVarietiesPartIIAutomorphicCohomology; its integration and usable stage/node must be checked rather than silently duplicated.

### RT-AREA-automorphic-1/17 — confirmed (medium)

Confirmed. CC.2 constructs a Banach module, CC.5 needs admissibility and a duality criterion, and R30.2 constructs only the GL2(Qp) category; neither supplies a shared general category to the other. Schneider–Teitelbaum v1 §3, Lemma 3.4 and Theorem 3.5 (pp.14–15), proves the finite-generation criterion, anti-equivalence and abelianness for a compact p-adic Lie group. Plan the Schikhof/continuous-dual category once beside, but separately from, finding 3's completed-algebra theorem and import it into CC and R30's specialization. Use K[[G]]=K tensor_o o[[G]], not an unrestricted inverse limit of K-valued finite group rings. Extending admissibility from compact G to a locally compact p-adic group requires the compact-open independence theorem; it is not literally Theorem 3.5's statement.

### RT-AREA-automorphic-1/18 — confirmed (medium)

Confirmed for the completed-Hecke/localization interface; the appended chain-model repair is only a scoped source lead. IHG.2 constructs finite Hecke images and localization on perfect complexes but is not an ancestor of CC.8. Gee–Newton v5 Definition 2.1.11 and Lemma 2.1.14, pp.10–11, constructs the profinite Hecke limit, proves stabilization of maximal ideals using finite-level homology/nilpotent kernels, and obtains semilocal complete factors. Ordinary algebraic localization exists without semilocality; what needs this proof is the compatible completed topological decomposition and its use in this tower. Add IHG.2→CC.8 and a source-qualified finite-image/inverse-limit producer, then let R31.3 specialize it. TC.2 already imports the suppliers, so an actual second localization construction there is not established by its two edges alone. Proposition 3.4.16 (p.23) concerns the patched complex over O_infinity[[K0]], with patching data and hypotheses: do not cite it as an unconditional proof of CC.4 for arbitrary towers or declare CC.4's existing source gap closed. Preserve the Emerton lifted-cell source action already in the decomposition.

### RT-AREA-automorphic-1/19 — confirmed (medium)

Confirmed missing explicit supplier/import for the binary and trace-zero ternary Siegel–Weil identities. YZZ's public author draft (6 November 2011), §1.5.1, printed p.23 (physical PDF p.23), independently identifies those two different inputs to (1.5.1)–(1.5.2), matching the supplied 2013 book at printed p.13; the accepted GZ.5 node repeats them but has no incoming producer node. Chuang–Wei printed p.3 corroborates the function-field use but is not a proof of YZZ's number-field statement. MP.6 is the reusable theta-integral interface. Gan–Qiu–Takeda v3 §1.7, p.3, gives the convergent range r=0 or m−r>n+epsilon_0; for the orthogonal/symplectic case epsilon_0=1. Supply the exact convergent or regularized identity, constants and measures for each GZ instance, adapting cover-specific Eisenstein analysis rather than blindly importing linear AS. There is already a proposed MetaplecticAutomorphicFormsPartIIShimuraWaldspurger owner including general Siegel–Weil/Rallis theory in the Ichino–Prasanna route. Coordinate MP.6's export with that producer; 'no stage' must not be read as 'no route exists'. The full Siegel–Weil proof is not certified by this dependency check. The Gan–Ichino parent brief itself imports MP.0–MP.6 and GZ.4–GZ.5: importing that whole Part II back into MP.6 or GZ.5 would be circular. Extract the applicable Siegel–Weil foundation before the Gross–Zagier-dependent suffix, with independent analytic suppliers, and let both consumers import it.

### RT-AREA-automorphic-1/20 — confirmed (medium)

Confirmed the shared Jacobi-theory boundary and L2s's missing supplier, with an important correction to the L2 allegation. MP.8 defines Jacobi forms in the BFH genus-two cover case, QM.1 separately asks to construct them despite importing MP.8, and L2s imports Jacobi structures from MP.0–6 although none of those stages states them. Own the reusable Jacobi group/Schrödinger–Weil representation, coefficient/index/multiplier data and Fourier–Jacobi/theta decomposition once, with symplectic and unitary instances; retain MP.8's specific GSp4 cover and QM.1's q-series applications. However, the quoted Jacobi paragraph inside the extracted L2 description is the embedded L2s subsection, not evidence of a separate L2 contract. L2s already reaches MP.6. Add an L2 edge only after its own Fouquet–Wan use is established; do not duplicate the CLW requirement because of extraction nesting. Pinned Mathlib jacobiTheta_S_smul concerns a particular theta function, not a Jacobi-form category.

### RT-AREA-automorphic-1/21 — confirmed (medium)

Confirmed. MP.3's assembled ancestors stop at MP.0–2, AL.0 and AA.0; its admissibility, finite-length and Jacquet-filtration targets have no SR.2/3 or AF.1 inputs. Add the relevant smooth-category/Jacquet/admissibility and real-module suppliers, and name SmoothRepresentationsOfLocalGroups and AdelicAlgebraicGroups in the roadmap's prerequisite list. Reuse the linear representation infrastructure via proved splittings and cover-specific categories. Neither ordinary SR results nor an archimedean (g,K) category automatically proves theta-module admissibility/finite length or full Howe duality. The repair must preserve MP.3's source-qualified range and residual-characteristic limits.

### RT-AREA-automorphic-1/22 — confirmed (medium)

Confirmed. The assembled atlas has the frozen QuadraticFormInvariants 6C owner, explicitly including dyadic Hilbert symbols, localHasse and comparison to the CFT pairing, but no path to MP.2. Import that exact layer for the Weil-index formulas; keep the real/complex place formulas separately scoped and prove the discriminant/convention bridge. The ClassFieldTheory link screen declined a direct MP dependency for the analytic product formula; it did not establish that MP.2 needs no quadratic-form input. A missing QuadraticFormInvariants link job is not permission to rebuild its immutable upstream carrier.

### RT-AREA-automorphic-1/23 — confirmed (medium)

Confirmed. MP.5 plans growth, genuine cusp/Eisenstein spaces, constant terms and theta-lift convergence, while its assembled graph contains AF.1 alone and only AA.0. Add AF.3 and AA.3 (AF.2 then arrives transitively), and prove the transfer of the relevant linear estimates to the cover with its actual splittings. MP.6/7 inherit those inputs; MP.8's later AS imports cannot supply earlier stages. Keep theta-specific convergence, regularization and allowable interchange proofs in MP; generic cusp-form rapid decay is not a proof that every theta integral converges.

### RT-AREA-automorphic-1/24 — confirmed (medium)

Confirmed a missing shared orbital-integral foundation, not an equality of weighted and invariant distributions. Arthur §18 p.102 explicitly builds weighted orbital integrals using a nonconstant weight against invariant measure. ET.1 already owns centralizer quotient measures, regular semisimple convergence and relevant singular extensions; AS.6 does not reach it. Use ET.1 (or an early extracted local prefix) as the shared owner, add ET.1→AS.6, and keep weighted estimates, (G,M)-families and fine expansions at AS.6. Do not move all weighted orbital integrals into ET.1, or infer singular convergence just from the regular theorem. Coordinate finding 4's Paley–Wiener supplier before both stages. The report's alternative AS.6→ET.1 is not selected for the combined repair.

### RT-AREA-automorphic-1/25 — confirmed (medium)

Confirmed a stage-level proof-closure omission, with existing routes retained. AF.4 only defines cohomological representations; the accepted Calegari–Geraghty and Ichino–Prasanna source routes already request the tempered cohomology range and Vogan–Zuckerman modules/cohomology there. Harder–Raghuram §3.1.4–5, pp.17–19, explicitly invokes Wigner and Delorme and computes the GLn range with split-centre and component-group terms. Expand the existing AF.4 plan using those routes, not a rival owner: Wigner's central-character vanishing criterion, the source-scoped tempered calculation and the unitary A_q(lambda) classification/cohomology. The interval [q0,q0+l0] depends on the chosen central quotient and coefficient/tempered hypotheses; it is not a claim about all cohomological representations. The Vogan–Zuckerman/Delorme original proofs remain to be decomposed, and the Hermitian Hodge bigrading is an additional specialization.

### RT-AREA-automorphic-1/26 — confirmed (medium)

Confirmed. AF.2 requires SR.3 but does not reach SR.4's spherical Hecke commutativity/Satake theorem. Goffeng–Mesland–Şengün v2 §§3.2–3.3 pp.6–7 makes the Gelfand-pair hypothesis explicit and distinguishes the unitary tensor-factorization theorem from Flath's admissible version; Harder–Raghuram §2.3.4 pp.14–15 uses the almost-everywhere commutative local algebra. Add SR.4→AF.2 and prove the one-dimensional invariant-line consequence at the hyperspecial places supplied by the reductive model. This does not assert one-dimensional invariants for every compact open or replace the admissible Flath theorem with the narrower unitary result.

### RT-AREA-automorphic-1/27 — confirmed (medium)

Confirmed. ALS.4 promises parabolic-induction/Satake compatibility but has no SR ancestor. SR.2 supplies normalized and unnormalized induction/Jacquet conventions, SR.4 supplies Satake and reaches RG2.4's Iwasawa decomposition. Add SR.2 and SR.4 to ALS.4. For integral boundary cohomology use the integral unnormalized transform with its valid coefficient hypotheses; do not silently adjoin a square root of q or import complex admissibility as an integral theorem. Harder–Raghuram Proposition 4.3 independently confirms the unnormalized induction convention for its characteristic-zero boundary formula.

### RT-AREA-automorphic-1/28 — confirmed (medium)

Confirmed. AA.4 and the ALS prefix use neat levels before the D5 definition and V0 existence result; V0 itself consumes ALS.0, so importing it backwards cycles. Milne (2017) §3 p.34 gives the representation-independent rational neatness definition and Proposition 3.5's finite-index congruence subgroup, citing Borel 17.4. Move the reusable neatness/existence API to an early AA.3/4 prefix and have ALS.0, D5 and V0 import it. Prove the passage to neat compact opens, normal cores and restriction of scalars with the correct convention (all rational intersections), rather than call Milne's rational-subgroup proposition literally a theorem about every element of a p-adic compact open. Preserve effective-action and central-unit caveats in ShimuraData; torsion-free does not imply an arbitrary arithmetic action is faithful. The Borel original proof remains to be expanded.

### RT-AREA-automorphic-1/29 — confirmed (medium)

Confirmed the duplicated/unspecified cochain owner. AF.1 constructs the relative complex and AF.1a identifies invariant forms with it, yet neither imports the other; BorelRegulators:R.2 imports AF.1a and RS-04 names AF.1. Make a single algebraic cochain/pair prefix available before both globalization and van Est, for example at AF.1a with AF.1a→AF.1, and retarget the RS-04 cochain rationale. Include the minimal compatible pair/module data there so that the repair does not secretly depend on AF.1's later globalization. The report overstates what the README forbids: it explicitly separates van Est from Eisenstein continuation and says globalization uses a separate source, not a blanket prohibition on every AF.1→AF.1a algebraic import. The independent-prefix repair nevertheless respects the intended separation.

### RT-AREA-automorphic-1/30 — confirmed (medium)

Confirmed. AF.4's integral Hecke eigenclasses and rationality theorem have no ALS local-system/Hecke or automorphic-cohomology comparison in the assembled closure. Harder–Raghuram §§2.3.1–2.3.4 pp.13–15 builds the rationality-field discussion on cohomology and its coefficient/Hecke actions. Import ALS.3 (hence ALS.1) and the required ALS.5/AS.5 characteristic-zero comparison for the rationality suffix. Keep purely local highest-weight/cohomological definitions earlier; the combined repair must not force a later AS.5 proof to assume this rationality conclusion. The GLn cohomological argument and strong multiplicity-one identification of its field do not prove a universal rationality/descent theorem for arbitrary automorphic representations; retain the actual group's source hypotheses.

### RT-AREA-automorphic-1/31 — confirmed (medium)

Confirmed the missing explicit generic-to-quaternionic ownership bridge, not that the quaternionic specialization is dispensable. AF.5 names the general finite-double-coset/algebraic-form dictionary, while R18.3 independently defines its integral definite-quaternion version and reaches no AF.5. AUDIT-15's duplicate note and unreviewed RS-23 leave the boundary unresolved. Give the reusable coefficient function space, Hecke and level-change API one earlier AF owner, or explicitly import AF.5's relevant prefix; retain R18.3's actual class-set/stabilizer computations, Taylor–Wiles freeness, dyadic tests and Jacquet–Langlands identification. Finiteness of a double-coset set is not freeness of its coefficient module. Moving the owner to AF.2/4 is an option requiring an actual split, not permission to move all AF.5 or all quaternionic geometry.

### RT-AREA-automorphic-1/32 — confirmed (low)

Confirmed the unprovided comparison suffix. AL.4's sole prerequisite is SR.4; neither AL.1–3 nor R01.2/ET.6 is an ancestor, although the text asks for analytic and Weil–Deligne comparisons. Keep the Satake-defined unramified polynomial independent, and put comparisons in a suffix (or AL.5) importing R01.2 and the precise analytic factor and compatibility theorem used. ET.6 is one possible supplier for its characteristic-zero finite-place cases, not a universal theorem for all reductive groups; an elementary unramified comparison may suffice after it is proved. R01.2 and ET.6 additions to AL.4 are individually acyclic on the snapshot, but the final split must be rechecked with all other repairs. Do not insert R19.4 merely as a named compatibility theorem without checking its arithmetic range and dependency direction.

### RT-AREA-automorphic-1/33 — confirmed (low)

Confirmed as a baseline-reuse clarification. At Mathlib 082e2d3, mellin/mellinInv are defined in Analysis/MellinTransform.lean:91/96; mellin_differentiableAt_of_isBigO_rpow:401 requires local integrability and two power bounds with b<Re(s)<a; MellinInversion.lean:92 additionally requires Mellin convergence, vertical integrability and continuity at x>0. ParametricIntegral.lean:288 needs a common neighborhood and an integrable derivative bound. AL.0 must import these real-line/Banach tools and prove its actual local/adelic estimates, character decompositions and normalization bridges. RS-07's accepted Mellin owner entry concerns AN.0; it does not itself rewrite AL.0. Do not delete all archimedean or holomorphic-family work: the existing real Mellin theorem is not directly a Mellin transform on R×, C×, a finite-place multiplicative group, or the idele class group, nor a general nuclear Fréchet theorem.

### RT-AREA-automorphic-1/34 — rejected (low)

Rejected as an assertion of unresolved duplicate ownership. CC's opening scope explicitly assigns generic coefficient/derived limits to R02.1–R02.3/D7 and limits its own work to tower finiteness, comparison and continuity. CC.2 already requires D7, and the assembled graph includes the accepted RS-08 direct R02.1→CC.2 import. Its accepted node applies filtered-colimit exactness and surjective-system lim1 vanishing to the actual tower's completion/Tate-module sequence; it is not a second generic derived-limit carrier. RS-08's omission of CC.2 from a 'formerly' array does not negate that explicit supplier. H.6 constructs spectral cofibres, homotopy groups and a spectrum Milnor sequence, which module/complex R02.1 does not provide; RS-33 itself retains a separate spectrum Milnor/Bockstein owner. Clarifying CC.2's construction verbs is optional, but neither deleting the tower proof nor treating spectral Milnor theory as a third copy is justified.

### RT-AREA-automorphic-1/35 — confirmed (low)

Confirmed only as citation and scope refinement. The pinned Mathlib ModuleCat AB5 instance (AB.lean:29), Functor.Final.colimitIso (Final.lean:348), and Tau Ceti moduleCat_ab5OfSize:64 and homologicalComplexHomologyFunctor_preservesColimitsOfShape:242 provide the generic module/complex facts, with the exact-shape, category and universe hypotheses. The reviewed coverage already correctly credits them. CC.1 should cite/apply these declarations rather than plan their reproving, retaining the actual level diagram, cofinality proof, smooth action and transported Hecke maps. These statements about module/homological-complex colimits do not automatically identify a colimit in an enhanced derived category; that comparison and all tower hypotheses remain work. No change to the correct coverage verdict is required.

### RT-AREA-automorphic-1/36 — rejected (low)

Rejected as a demonstrated second generic construction. ALS.6 explicitly describes itself as a late re-export of CC.2/4/7, distinguishes the early ALS prefix consumed by CC, and identifies its own arithmetic finite-cover and tower applications. Its existing imports transitively include CC.0 and CC.1. The accepted graph therefore already supports identifying its level systems with the CC systems; the modular-curve/anisotropic tests and finite-cover descent are not replaced by completed descent. RS-09's unreviewed narrowing makes that intended facade more explicit, but its existence is not evidence of two incompatible tower carriers in the current text. Preserve one object and its comparison maps; do not create a mandatory duplication fix solely from the verb 'assemble'.

### RT-AREA-automorphic-1/37 — confirmed (low)

Confirmed as a narrow baseline-citation clarification, not removal of convergence analysis. Pinned Mathlib MeasureTheory.integral_prod (Integral/Prod.lean:440), integral_tsum (DominatedConvergence.lean:88), and dominated parametric differentiation (ParametricIntegral.lean:288) supply the generic Bochner interchange statements with explicit integrability, summability, measurability and domination hypotheses. The audit already credits these and AS.0 already says to reuse Bochner integration. Make those imports explicit in the target/API. Retain proving that automorphic kernels/families satisfy their hypotheses, plus direct integrals, trace-class/nuclear or unbounded-operator extensions and distributional convergence. A conditional Fubini theorem does not establish convergence of a trace-formula integral or arbitrary Fréchet-valued interchange.

### RT-AREA-automorphic-1/38 — confirmed (low)

Confirmed for the unreviewed RS-04 edge, not a live-graph deletion. Its stated AA.3→AF.1 rationale is a shared height/growth comparison. Bernstein–Krötz §2.1.2 p.5 and §2.3.1 p.8 constructs polynomial-equivalent real algebraic scale functions and moderate growth without an adelic quotient or global Siegel-set theorem. AF.1's real local category should import that local norm lemma; remove the unnecessary global reduction-theory requirement from the proposal. AA.3 remains a legitimate supplier to AF.0/2/3. If sharing norm machinery, extract only that lemma before both, preserving local/global distinctions and avoiding a new circular reverse import.

### RT-AREA-automorphic-1/39 — rejected (low)

Rejected as a false theorem actually asserted by ALS.3. The text asks for compatibility of a pullback/trace correspondence with cup products; it does not say that the resulting Hecke operator is multiplicative. Projection formulas and Hecke adjointness are valid such compatibilities, and the early ALS.5 duality prefix explicitly plans the adjoint formulas. The reported counterexample is correct: for unnormalized finite-cover trace T(1)=d, hence multiplicativity would force d=d²; Tau Ceti f790474's HeckeCoset.degree_eq_relIndex and GL2.degree_diagCoset_prime_pow yield d=p+1 in the given case. This disproves the added interpretation, not the current statement. It is a useful non-example and wording improvement for the blueprint, but insufficient to label the accepted stage mathematically erroneous. Preserve projection-formula and pairing compatibility, with coefficient/orientation and normalization conditions.

### RT-AREA-automorphic-1/40 — confirmed (low)

Confirmed an underspecified/tautological milestone. Bernstein–Krötz §4 pp.20–22 defines weak admissibility by finite K-multiplicities, states irreducible weak admissibility and finiteness of infinitesimal-character fibres (Theorem 4.2), and gives the finite-generation/Z(g)-finite/n-finite equivalences (Theorem 4.3). AF.1's request to prove finite multiplicities for already admissible modules does not identify these needed theorems. Replace it with precise definitions and the source statements. The paper uses 'admissible' for the additional finitely generated Harish–Chandra condition, so fix terminology rather than pretend every author uses identical definitions. Finite length is a further standard consequence requiring its own proof/locator; it is not literally one of the three clauses of Theorem 4.3 read here. Preserve its proof obligation alongside the globalization prerequisites of finding 2.

### RT-AREA-automorphic-1/41 — confirmed (low)

Confirmed a presentation/extraction error. The parent ALS.5 and early ALS.5:finite-level-duality records repeat the same description, and the parent title is the early-prefix label although the README heading is Duality and comparison. Its actual graph already distinguishes the prefix from the later AF.1a/AS.5 characteristic-zero comparisons. Restore the parent title and retain its later Betti/de Rham/relative-Lie and automorphic targets, importing the existing early prefix. Do not merge or delete the early stage, remove its CC.7 consumers, or silently drop support/orientation hypotheses. This is separate from the audit-target correction in RT-AUDIT-13.

## Public source ledger and proof limits

Sources accessed 2026-09-24. The table records **passages at physical PDF pages,
starting at 1**, not a claim to have read each whole source or every word of each
page. Printed locators and statement numbers are in the reasons. SHA-256
identifies the downloaded bytes. Source proofs imported by these passages are
not silently treated as read.

| Source | Physical PDF pages inspected | SHA-256 |
| --- | --- | --- |
| [Tunnell](https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf) | 1, 2, 3 | `fc276270d09ea11b98d750deeba26193e07d5aac2d30ffe16dbf0f7f576ffc5c` |
| [Jacquet](https://www.math.columbia.edu/~hj/PerfectRankinSelberg.pdf) | 2, 3, 4 | `7a11766eadf25fb7452ce7faa193469791796f572fc654c8fe90a8608bb46afe` |
| [Cogdell](https://people.math.osu.edu/cogdell.1/fields-www.pdf) | 30, 33, 34, 37, 44, 45, 46, 65, 66 | `2c5ec050a6db216dcd2104b7fe266ddc03e4db7c7d300239e60d6ee9c40618a7` |
| [BK](https://arxiv.org/pdf/0812.1684) | 3, 4, 5, 6, 8, 20, 21, 22, 40 | `f5f2e79d87532c9ac46389d7eb1606e0301eac0ba7c7972ab628e278e091ca3e` |
| [ST](https://arxiv.org/pdf/math/0005066v1) | 1, 12, 13, 14, 15 | `28dfe78dc1fcbe908641523a17ee1fdec5f330494dfdd5e4a48ac7b181c78747` |
| [Rapinchuk](https://arxiv.org/pdf/1207.4425) | 12, 13 | `43f6a45ceb9e51e1ca959c0d0574474cb1c20ea5a4e13852eee1886aceadab97` |
| [Arthur](https://www.claymath.org/library/cw/arthur/pdf/62.pdf) | 65, 66, 102, 118, 119, 135, 146, 148 | `2b6623010ce5d854732458dfb5e61600a4e6cc7288629a72cb63d5f7530ac510` |
| [HR](https://arxiv.org/pdf/1405.6513) | 13, 14, 15, 16, 17, 19, 25, 26, 27 | `1d3af2de1c1a370dc339e10c74cda84f5e6f5b25c09810bfdf8bbbbc8df6ca06` |
| [Scholze](https://arxiv.org/pdf/1306.2070v2) | 69, 70 | `e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285` |
| [GN](https://arxiv.org/pdf/1609.06965v5) | 10, 11, 23 | `068818a4b0e12f97184d72cd7704663f5269f9297f017ff99172325ed5f67601` |
| [GQT](https://arxiv.org/pdf/1207.4709v3) | 3, 4, 6, 7 | `cde6b7ad22b974d4159f8cedd1e14a00bf4b05ec977ab750b54fdceb067adac5` |
| [ChuangWei](https://www.ams.org/journals/tran/2019-371-01/S0002-9947-2018-07208-7/tran7208_AM.pdf) | 3, 4 | `400219a5fd976be14fa787da62fbdbc46fe0aa5ff4f32a068f5d57417adada21` |
| [Milne](https://www.jmilne.org/math/xnotes/svi.pdf) | 34 | `f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e` |
| [GMS](https://arxiv.org/pdf/2412.02379v2) | 6, 7 | `3ad9ef632061d632d08f986364ac66bcdb76493b71ad42523d568ac466ea2429` |

YZZ's [public author draft dated 6 November 2011](https://www.researchgate.net/profile/Xinyi-Yuan-11/publication/267551160_Gross-Zagier_Formula_On_Shimura_Curves/links/548e842c0cf225bf66a5ff13/Gross-Zagier-Formula-On-Shimura-Curves.pdf),
§1.5.1, printed and physical PDF p.23, was read through the web PDF text
(lines 934–944). It explicitly identifies the quadratic spaces E and B0 used
by the two Siegel–Weil applications. A direct byte download returned HTTP 403,
so no byte hash is claimed for that public draft. The same passage was checked
against the supplied 2013 book at printed p.13 (physical p.23); its SHA-256 is
`6a87b131febb325ea59259098117cc79dfeecbeae66f8ebaeac9fbd66e345337`. The public draft supplies the evidence used here;
this review does not republish its formula transcription or claim the old draft
incorporates the book's later errata.

The Milne file is the supplied 2017 version of the public author notes, §3,
p.34; the public author URL is recorded in the table. Arthur is the Clay survey,
not independent reading of all papers it cites. Tunnell's three-page announcement
establishes consumption of the named inputs, not their full proofs.

Outstanding source interiors include JPSS/Gelbart–Jacquet and the exact converse
variants, the original Lazard/Venjakob arguments, CD/BDK and Arthur's cited
harmonic-analysis proofs, Tits/Platonov, Vogan–Zuckerman/Delorme and Borel 17.4.
The Siegel–Weil identities still need full source-qualified proof decompositions.
Scholze IV.2.1's proof was read; its imported comparison/compactification/almost
purity proofs were not certified here. Gee–Newton 3.4.16 was checked for its
patched hypotheses, not proved for a general tower. A confirmed dependency gap
does not close any of these proof obligations.

## Joint graph check

The following missing supplier edges were tested as one union. Short codes have
the roadmap meanings used by the findings; fully qualified exceptional targets
are retained. Some are redundant once another edge in the union is inserted.
The final fixer must implement the narrower prefixes where the reasons require
them and rerun graph validation after creating or moving stages.

| Supplier | Consumer |
| --- | --- |
| `AA.3` | `MP.5` |
| `AA.4` | `ALS.0` |
| `AA.4` | `ShimuraData:D5` |
| `AA.4` | `ShimuraVarieties:V0` |
| `ArithmeticGaloisRepresentations:R01.2` | `AL.4` |
| `ALS.3` | `AF.4` |
| `ALS.5` | `AF.4` |
| `AF.1` | `ALS.4` |
| `AF.1` | `MP.3` |
| `AF.3` | `AL.2` |
| `AF.3` | `AL.3` |
| `AF.3` | `MP.5` |
| `AF.5` | `R18.3` |
| `AL.0` | `R16.1` |
| `AL.3` | `AL.4` |
| `AL.3` | `AutomorphicPadicLFunctions:L1` |
| `AL.5` | `AutomorphicPadicLFunctions:L1` |
| `AS.5` | `AF.4` |
| `ET.1` | `AS.6` |
| `ET.6` | `AL.4` |
| `R16.4` | `R17.3` |
| `R16.6` | `R17.5` |
| `R17.3` | `R18.3` |
| `IHG.2` | `CC.8` |
| `MP.8` | `AutomorphicCongruences:L2s` |
| `NE.0` | `CC.5` |
| `R30.2` | `CC.5` |
| `RG2.4` | `AA.4` |
| `SR.2` | `ALS.4` |
| `SR.2` | `MP.3` |
| `SR.3` | `AL.2` |
| `SR.3` | `MP.3` |
| `SR.4` | `ALS.4` |
| `SR.4` | `AF.2` |
| `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant` | `MP.2` |

## Validation

- Exactly 41 distinct input IDs have exactly one decision each. The input
  severities are preserved in this report; the JSON uses the prescribed schema.
- Run the red-team checker and `intake.py check-files` on the two deliverables;
  record their actual results in the PR. No input finding or roadmap is edited.
- Recheck the relevant input hashes and graph-file set against current main
  before publication. The PR contains only the two permitted review files.
- No Lean file is a deliverable of this review. No Lean compilation or completed
  mathematical formalization is claimed.
