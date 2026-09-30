# RT-PAPER-LAWRENCE-VENKATESH-20: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5015, job FIX-RT-PAPER-LAWRENCE-VENKATESH-20).

- **Findings:** `RT-PAPER-LAWRENCE-VENKATESH-20.result.json`.
- **Verdicts:** `RT-PAPER-LAWRENCE-VENKATESH-20.review.json` and `reviews/REV-RT-PAPER-LAWRENCE-VENKATESH-20.md` (verifier `cc-58621d`). All twelve findings are confirmed: two high (/1, /2), three medium (/3–/5) and seven low (/6–/12).
- **What this job fixes:** the high and medium findings, /1–/5, as the issue lists them.
  - Where the verifier's reason differs from the red team's fix text, I followed the reason. It sets the scope of each fix.
  - The low findings are recorded below and not applied (PROTOCOL §17).
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-LAWRENCE-VENKATESH-20 (PR #4763).
  - It also wrote the Betts–Stix red team (PR #4718) and the Betts–Stix fix (PR #5222).
  - It wrote FIX-RT-AUDIT-07, whose note concerns LV.6, and PAPER-DELIGNE-80, whose routes go to DWP.7 and LPV.5.
  - It did not write this extraction, its review or the verification.
  - The fix follows only the scope that the independent verifier authorised. The verifier changed my own red-team fixes in /1, /2, /3, /4 and /5, and each section says how I applied its version.
- **Files changed. Only the deliverables:**
  - `papers/PAPER-LAWRENCE-VENKATESH-20.result.json`;
  - `papers/PAPER-LAWRENCE-VENKATESH-20.md`. The edits cover the count lines, the "Planned elsewhere" bullet, route 1's first bullet, route 2's paragraph, new paragraphs for routes 3 and 4, the prerequisites list, and a closing section "Fixes after the red team";
  - `papers/PAPER-BETTS-STIX-25.result.json`: notes on items /12 and /13 only, as the verifier allowed for /4 ("the fix job may add the cross-reference to Betts–Stix /12–/13 itself"). Its routes are unchanged;
  - this report.

  The review files, the LV packet, the other extractions, `make_queue.py` and `queue.json` are not deliverables. Every change a finding asks of them is listed under "For the maintainer".
- **Result.**
  - **Items:** 95 (4 library, 55 planned, 36 missing). There were 67 (3 library, 41 planned, 23 missing).
  - **Routes:** 4 (2 before).
  - **Prerequisites:** 12 (9 before).
  - **Source issues:** E1–E3, unchanged.
  - **New items:** 28, appended after the old ones. Their ids are slugs, like the old ones.
  - **Route sizes:** route 1 has 22 items (22 before, with two items out and two in); route 2 has 5 (1 before); new route 3 has 8; new route 4 has 1.
- **Edits.**
  - One Python script edited the result, one the report and one the Betts–Stix result.
  - Each substitution asserted that its old text occurred exactly once. Each replaced field asserted its old value, and each new note asserted that the item had none.
  - The LV script also asserted the final invariants:
    - 95 distinct item ids;
    - the counts 4 / 55 / 36;
    - every missing item taken by exactly one route;
    - route sizes 22 / 5 / 8 / 1;
    - 12 prerequisites and source issues E1–E3.
  - Both results keep their formatting: indent 1 (LV) or 2 (Betts–Stix), non-ASCII characters written literally, and a final newline. I checked before editing that re-serialising each file gives it back unchanged.
  - Two passages were corrected afterwards, each by a single asserted substitution: the locator of /strassmann, after I checked the page, and the wording of /good-model-gm-general on where the formal solutions live (see /10).

## Route positions

The queue matches review verdicts to routes by position (`accepted_routes` in `make_queue.py`).

- **No route was retargeted in place.** Routes 1 and 2 keep their kind, roadmap, parent and stages. Their verdicts still belong to the routes they were given to.
- **Routes 3 and 4 are new and appended at the end.** Neither has a review verdict yet, and each reason says so. `accepted_routes('PAPER-LAWRENCE-VENKATESH-20')`, run read-only, returns routes 1 and 2 only.
  - Route 3: source, MordellLawrenceVenkatesh LV.2–LV.4.
  - Route 4: part-ii, parent LogicAndDefinabilityInNumberTheory, roadmap LogicAndDefinabilityPartII.
- **Changed items on routes whose target is unchanged:**
  - Route 1 loses /g-semisimplification and /lemma-2-6 to route 2. It gains /analytic-nullstellensatz and /fibre-functor-comparison. Its brief changes in two passages and gains a closing paragraph.
  - Route 2 gains /g-semisimplification, /lemma-2-6, /richardson and /h1-finiteness-padic.

  Each reason ends with a dated sentence saying which items have no verdict yet.
- **Betts–Stix:** no route changed. `accepted_routes('PAPER-BETTS-STIX-25')` still returns all seven routes in order, with their original targets.

## /1 (high, error): the §3 items were stated in a generality nothing plans: fixed

I followed the verifier's version. Each item is split. The general case goes by a new source route to LV.2–LV.4, not to the Part II. H is planned at R09.1, H* is a new missing item, and the general crystalline comparison is CP.2 with R06.2, not R06.5.

- **Restricted in place, still planned at LV.2–LV.4.** Each note records the split:
  - /good-model-gm: an abelian-by-finite family, q = 1, a base of any dimension;
  - /monodromy-group: H¹ of an abelian-by-finite family;
  - /lemma-3-1 and /lemma-3-3: H = LGr_E(V, ω), as in LV.3's Setting P, for a base of any dimension;
  - /crystalline-transport: the transport identification in the H¹ case (split from the comparison theorem, see /5);
  - /prop-3-4: a polarized abelian scheme over a curve, concluding finiteness, which is exactly node LV.4/proposition-3-4.
- **New missing items on route 3:**
  - /good-model-gm-general, /monodromy-group-general and /period-maps-general. The last defines Φ_C and Φ_v for H^q, and Φ_p into H*_{Q_p} for (9.2);
  - /lemma-3-1-general and /lemma-3-3-general;
  - /crystalline-transport-general and /prop-3-4-general;
  - /compact-dual-H-star. H* is the variety of self-dual filtrations of (V, ⟨,⟩) with given dimensions, (F^p)^⊥ = F^{d+1−p}: a projective homogeneous variety of Aut(V, ⟨,⟩) containing the period domain as an open subset.
- **New planned item /flag-variety-H** at AlgebraicModuliForArithmeticGeometry R09.1. Its note says what LV.3 and Tau Ceti HodgeStructures L3 plan instead.
- **The verifier's corrections of "nothing plans" are recorded in the notes:**
  - LV.2's formal horizontal-section, convergence and residue-disk nodes are general;
  - Lemma 3.2 (item /lemma-3-2) is general and is not split;
  - C5 plans the complex Gauss–Manin side (item /gauss-manin-katz-oda).
- **Route 1's brief** no longer tells the design job to import period maps from "LV.2–LV.3". It imports Gauss–Manin transport and the complex and p-adic period maps for H^q of general families, into H (R09.1) and H*, from LV.2–LV.4, and says that route 3 sends the general case there and that Betts–Stix route 4 sends the general v-adic period map to LV.3 as well.
- **Checked myself.**
  - arXiv v3 §3.1 (p. 15): "Let Y be a smooth K-variety, and π : X → Y a proper smooth morphism".
  - p. 16: "Fixing a degree q ⩾ 0".
  - Proposition 3.4 (p. 19): "X → Y is a smooth proper family over K, V is the degree q de Rham cohomology".
  - §9.1 (p. 51): "a certain complex flag variety H∗, which parameterizes isotropic flags with a given dimensional data inside a certain orthogonal or symplectic complex vector space".
  - (9.2) (p. 52).
  - The LV roadmap's LV.2–LV.4 texts and the packet nodes LV.3/padic-period-map, /complex-period-closure-contains-orbit, /padic-period-image-dense, LV.4/fibre-representation-crystalline, /fibre-filtered-phi-transport and /proposition-3-4, all in Setting P.
  - The stage texts of R09.1, CP.2, R06.2, R06.5, C5 and HodgeStructures L3.

## /2 (high, error): Bakker–Tsimerman had no owner: fixed

I followed the verifier's version. The theorem goes on a part-ii route keyed like PAPER-MOK-PILA-TSIMERMAN-19 route 1, so that it joins the pending DESIGN-LogicAndDefinabilityInNumberTheoryPartII.

- **/bakker-tsimerman** is `missing`, and its `planned` field is removed.
  - Its note gives LD.6's wording and says that the LD Part II covers Shimura varieties only.
  - It also records that Bakker–Tsimerman's own Theorem 1.1 is for any pure polarized integral variation of Hodge structure, with target the compact dual Ď of the weak Mumford–Tate domain. LV state it under big monodromy, where Ď = H*.
- **New route 4** (part-ii) has parent LogicAndDefinabilityInNumberTheory and roadmap LogicAndDefinabilityPartII, the same id and parent as MPT-19 route 1. `make_queue.paper_designs` groups part-ii routes by parent, so the route joins DESIGN-LogicAndDefinabilityInNumberTheoryPartII, which is pending in `queue.json`. The design has not landed, so there were no layers to route to.
  - Its title adds "and variations of Hodge structure". The design job settles the final title.
  - Its brief states Bakker–Tsimerman's Theorem 1.1 as a second final theorem, generalizing the Shimura case. It adds the planning context: weak Mumford–Tate subvarieties, the definable fundamental set, the volume bound (their Theorem 1.2), and LV's Corollary 9.2 as the export. It names the imports, and the single-owner question for the Shimura and VHS theorems.
- **Route 1's brief** now imports "Bakker–Tsimerman's Ax–Schanuel theorem for variations of Hodge structure from LogicAndDefinabilityPartII".
- **Checked myself.**
  - Bakker–Tsimerman, arXiv:1712.05088v1 (SHA-256 `a60d609e…`), p. 2, Theorem 1.1: "let V ⊂ X × Ď be an algebraic subvariety, and let U be an irreducible analytic component of V ∩ W such that codim_{X×Ď}(U) < codim_{X×Ď}(V) + codim_{X×Ď}(W). Then the projection of U to X is contained in a proper weak Mumford–Tate subvariety". Its setup is on pp. 1–2, and the Cattani–Deligne–Kaplan algebraicity is on p. 2.
  - Crossref gives Invent. Math. 217, pp. 77–94, for doi:10.1007/s00222-019-00863-8.
  - LV Theorem 9.1 is on p. 52.
  - LD.6's stage text, and MPT-19 route 1's key, title and brief.
- **For the maintainer:** PAPER-LAWRENCE-SAWIN-25/44 and /76 should follow the theorem (see below).

## /3 (medium, error): items used uncorrected statements: fixed for four items, notes on two

I followed the verifier's version: four items are restated, and /lemma-2-3 and /prop-5-3 gain notes only.

- **/lemma-2-8 (E3).** The identity now holds on O_{K_v}^×. The final sentence (w even, Hodge–Tate weight w/2) is kept.
  - The note gives the counterexample, which I re-derived. Take K = Q, v = p, and η = χ_cyc^{±1}, with the sign that makes η pure of weight 2 in whichever Frobenius convention is used.
  - Q has no CM subfield, so p is friendly. η is ramified only at p and locally algebraic.
  - The reciprocity map sends p to an element acting trivially on Q_p(μ_{p^∞}) (Lubin–Tate theory for the uniformizer p), under either normalisation. So η²(p) = 1, Norm(p)² = p², and χ(p) = p^{−2}, which has infinite order.
  - The note also records that, with matching normalisations, the identity does hold on units.
- **/lemma-2-12 (E22):** "for all i ≠ j".
  - I checked the vacuity: for i = j the two projections are one operator, so no g can give them fixed spaces of different dimensions.
  - With i ≠ j and N = 1, the corrected lemma reads "G surjects onto Sp(V), so G = Sp(V)", which is true.
- **/lemma-6-3 (E10, E25):** φ is a bijective semilinear similitude, A is nonempty, and 0 ≠ W ≠ V.
- **/lemmas-8-2-8-3 (E13, E14):** e is nonseparating, and M is positive and sufficiently divisible.
  - The rank is k − 1. The cycle types (1^q), (q) and (1, r, …, r) of Aff(q) have k = q, 1 and 1 + (q − 1)/r, which are pairwise different, so the rank determines the type.
  - The note gives the disk counterexample, and the q-cycle collision without the hypothesis.
- **/lemma-2-3 (E2):** a note only. The lemma is true for any finite S, but its applications need T = S ∪ {places above p}.
- **/prop-5-3 (E7):** a note only. The written proof needs odd residue characteristic. The statement is kept in full, following E7's review.
- **Gap `roadmap-errata`.**
  - Its last sentence now says that this file's items use the corrected statements, and which.
  - Its item list now adds /lemma-2-3, /lemma-2-8, /lemmas-8-2-8-3 and /lemma-2-6.
- **Not in a deliverable:** the review's note "All compared statements match their items" in `papers/PAPER-LAWRENCE-VENKATESH-20.review.json`. See "For the maintainer".
- **Checked myself.** Lemmas 2.3 and 2.8 (pp. 9–13), Lemma 2.12 (p. 14), Lemma 6.3 (p. 33) and Lemmas 8.2–8.3 (p. 42) in arXiv v3, and E2, E3, E7, E10, E13, E14, E22 and E25 with their review verdicts in `errata/MordellLawrenceVenkatesh.json`.

## /4 (medium, duplicate): Lemma 2.6 and G-irreducibility had two owners: fixed

I followed the verifier's version: LV.1 is the owner, through route 2, which was already a source route to LV.1.

- **Moved to route 2:** /g-semisimplification and /lemma-2-6. Their notes name LV.1 as the one owner, with Betts–Stix /12 and /13 as the GSp case.
- **/lemma-2-6 is restated** with E27's domain: the refinement is about ρ: G_K → L_Q(Q_p).
  - The note records E28, with the SL₂ ⊂ GL₂ counterexample to the printed step and the centralizer correction.
  - It says what a complete proof needs: finiteness of orbits modulo Z_{GL_n}(L), from Richardson over Q̄_p and finiteness of H¹(Q_p, −).
  - It cites PAPER-LAWRENCE-SAWIN-25/41 (their Lemma 5.49) as a corrected argument, as the verifier asked.
  - It states E28's review verdict: the review disproves the printed step, not the lemma.
- **Route 1's brief** imports Serre's G-notions and Lemma 2.6 from LV.1, says that the printed proof is incomplete (E28), and keeps Lawrence–Sawin's disconnected form "only as an extension of LV.1's statement, not as a second finiteness lemma".
- **New items on route 2**, both missing, since nothing in the atlas plans them (I searched the stage texts): /richardson and /h1-finiteness-padic ([41, III §4, Theorem 4]).
- **Prerequisite added:** Richardson, *Conjugacy classes in Lie algebras and algebraic groups*, Ann. of Math. 86 (1967), 1–15 (doi:10.2307/1970359, checked with Crossref).
- **Betts–Stix.** /12 gains a note, and /13's note is extended. Both say that the general notion and Lemma 2.6 are routed to LV.1 and that these items are their GSp case.
  - /13's note gives the reduction: for GSp-irreducible ρ, ρ^ss = ρ, and isomorphism of symplectic representations is GSp(Q_p)-conjugacy.
  - It also points to E28.
  - Betts–Stix's routes and statements are unchanged.
- **One caveat, stated in /richardson's note.** I could not read Richardson's paper, since Ann. of Math. 1967 is not openly available. The item states the theorem in the form the corrected proof needs, a finite union of double cosets G·g·Z_{GL_n}(l). The paper's own wording omits the centralizer, and E28 shows that it is needed. LV.1's design must state the theorem from the source.
- **Not in a deliverable:** Lawrence–Sawin /37, /41 and /70. See "For the maintainer".

## /5 (medium, missing): the imported theorems had no items: fixed

I followed the verifier's version: (9) planned at WC.2, (10) Krull in Mathlib, (6) split, and (3) with smooth proper base change named. I made one further correction to a status, flagged below. The new items are:

| item | status | owner |
|---|---|---|
| /chebotarev | planned | tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev |
| /weil-abelian-varieties | planned | DeligneWeightsAndPurity:DWP.1 |
| /deligne-purity | planned | DWP.4, WeightsInEtaleCohomology:R34.5, DWP.7 |
| /good-reduction-unramified | planned | SchemeAndStackFoundations:SF.2, NeronModelsAndSemistableAbelianVarieties:R11.5 |
| /dcris-fully-faithful | planned | PadicHodgeTheory:R06.2 |
| /faltings-crystalline-comparison | planned | CohomologyComparisons:CP.2, PadicHodgeTheory:R06.2 |
| /berthelot-ogus | planned | CrystallineCohomology:CR.2, CR.3 |
| /gauss-manin-katz-oda | planned | ComplexComparisonPartII:C5 |
| /fontaine-laffaille | planned | FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3 |
| /fibre-functor-comparison | missing, route 1 | candidate supplier MotivesAndAlgebraicCycles:MC.6 |
| /strassmann | planned | MordellLawrenceVenkatesh:LV.3 (node LV.3/strassmann) |
| /riemann-existence-gaga | planned | InverseGaloisAndArithmeticFundamentalGroups:IG.3, ComplexComparisonPartII:C2 |
| /weil-pairing-curves | planned | EtaleDualityAndPerverseSheaves:EDC.2 |
| /lefschetz-trace-formula | planned | WeilConjectures:WC.2 (node WC.2/lefschetz-trace-formula-proper-smooth-via-duality) |
| /richardson | missing, route 2 | — |
| /h1-finiteness-padic | missing, route 2 | — |
| /analytic-nullstellensatz | missing, route 1 | — |
| /tate-algebra-noetherian | planned | tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras |
| /krull-intersection | library | mathlib:Ideal.iInf_pow_eq_bot_of_isDomain |

- **Split, as (4) asks:** /crystalline-transport no longer contains the comparison theorem, which is now /faltings-crystalline-comparison, owned by CP.2 with R06.2 (the verifier's correction in /1).
- **(3), as the verifier corrected it:** smooth proper base change is owned by SchemeAndStackFoundations SF.2 ("construct sheaf cohomology, localization, proper/smooth base change and compact support"). R11.5 covers abelian varieties only.
- **(6), as the verifier corrected it:** Fontaine–Laffaille theory is planned at R07.3. The comparison of the two fibre functors is missing and routed with /hodge-torus-in-galois-image to route 1, with MC.6 named as the candidate supplier.
- **(9):** the trace formula is planned at WC.2, as the verifier found.
- **(10):** Krull's theorem is library. I read Mathlib 082e2d3, `Mathlib/RingTheory/Filtration.lean:463`: `theorem Ideal.iInf_pow_eq_bot_of_isDomain [IsNoetherianRing R] [IsDomain R] (h : I ≠ ⊤) : ⨅ i : ℕ, I ^ i = ⊥`. The paper applies it to R/𝔭.
- **Flagged deviation: Noetherianity of the Tate algebra is marked planned, not missing.** The red team called it unplanned, and the verifier left that unchanged. But Tau Ceti's AdicSpaces roadmap, Layer 0, §0.5, lists as milestone 4 "Noetherianity of `K⟨X₁,…,Xₙ⟩` for such a field `K`" (a complete rank-one nonarchimedean field), and concludes "from BGR 5.2.6 that every complete rank-one nonarchimedean field is strongly noetherian". PROTOCOL §16 makes such an item `planned`.
  - At the pins it is not library. Tau Ceti f790474 has restricted power series and `TauCeti.Huber.IsStronglyNoetherian`, but no theorem that a complete nonarchimedean field is strongly Noetherian.
  - The next review should confirm this status.
- **Chebotarev is not library.** At Tau Ceti f790474, `declarations.tsv` has only the `NumberField.Chebotarev.*` preparatory declarations (`frobeniusPrimeSet` and its lemmas), and Mathlib 082e2d3 has only `NumberField.Set.HasDirichletDensity`.
- **Route 1's brief** gains a closing paragraph. It lists the imports with their owners and the two missing inputs to plan there (the Nullstellensatz, and the fibre-functor comparison with MC.6).
- **Prerequisites added:**
  - Faltings 1989 (zbMATH an:0805.14008, the link used by another accepted extraction);
  - Katz–Oda 1968 (doi:10.1215/kjm/1250524135, checked with Crossref);
  - Richardson 1967 (/4).
- **Checked myself**, in arXiv v3:
  - the uses of Chebotarev (pp. 21, 27, 61);
  - [8, Proposition 9.1.9] and [16] (p. 19), [6, Corollary 7.4] (p. 17) and [23, Theorem 1] (p. 15);
  - footnote 10 (p. 61);
  - the Weil pairing (p. 27);
  - π₁^geom as a profinite completion (p. 26) and GAGA (p. 37);
  - Richardson and [41] (p. 11);
  - the Nullstellensatz (p. 54) and Krull (p. 55);
  - the point count (p. 74);
  - the Newton–Hodge argument in the proof of Lemma 4.4 (p. 24).

  I also read the stage texts of every owner in the table, in `research/blueprint/atlas/roadmaps/`, and the WC.2 node in `data/decompositions/WeilConjectures.json`.

## /6 (low, library-claim): Hermite–Minkowski and Grassmannians: not applied

This is a low finding, recorded only.
- /hermite-minkowski's relative "unramified outside S" form is the node R28.1/hermite-minkowski-finiteness-of-extensions-unramified-outside-S.
- As the verifier corrected it, /grassmannian splits in three: the functor of points (`Module.Grassmannian`, library), the Grassmannian and flag schemes (R09.1) and LGr (LV.3).
- The locator should read Gr(V_v, d) (E26).

The new item /flag-variety-H already cites R09.1 for the flag scheme.

## /7 (low, duplicate): S-unit theorem and Mordell: not applied

This is a low finding, recorded only. /s-unit-theorem should cite DiophantineApproximationAndTranscendence DT.2, and /theorem-5-4 HeightsRationalPointsAndObstructions RP.4 with the R28.5 node. Notes should say that LV.6 and LV.11 give independent proofs.

## /8 (low, duplicate): G-semisimplification and LanglandsParameterStacks LP2: not applied

This is a low finding, recorded only.
- /g-semisimplification should cross-reference LP2:semisimple-characters/semisimple-parameters-and-closed-orbits and PAPER-LAWRENCE-SAWIN-25/37 (Bate–Martin–Röhrle).
- As the verifier corrected it, the overlap runs both ways.
- /4 moved the item to LV.1. The question of one owner upstream of LV.1 and LP2 is for the maintainer.

## /9 (low, duplicate): hypersurface monodromy and LPV.5: not applied

This is a low finding, recorded only. /hypersurface-monodromy's symplectic case is covered by LefschetzPencilsAndVanishingCycles LPV.5 through the Betti–ℓ-adic comparison. The orthogonal case is planned nowhere.

## /10 (low, error): item statements: not applied

This is a low finding, recorded only.
- /theorem-10-1 should read "the Zariski closure of monodromy contains the identity component of Aut(V₀, ⟨,⟩)", as (10.1) does. In the orthogonal case, Picard–Lefschetz reflections have determinant −1.
- The finiteness addendum is in Theorem 10.1 itself (p. 56), so a note citing footnote 8 suffices.
- (b) splits Proposition 10.2 from its corollary. (c)–(g) are as filed. Point (e) (the formal horizontal sections lie in K[[z]], and only the connection coefficients lie in O_(v)) still applies to /good-model-gm, whose wording this fix kept apart from its setting. The new item /good-model-gm-general already states it correctly.

## /11 (low, missing): seven further source issues: not applied

This is a low finding, recorded only. All seven are in arXiv v3 and in the published text:
- (i) The proof of Lemma 2.10 applies Lemma 2.9 to an induced representation that is not crystalline when some L_u/K_v is ramified. Stating Lemma 2.9 for de Rham representations repairs it.
- (ii) Lemma 10.5: Z(φ) ⊆ Z(φ^ss), so the hypothesis does not bound z. Lemma 10.4's (10.16) supplies the bound for the semisimplified Frobenius.
- (iii) in the proof of Theorem 5.4, "any prime ℓ … less than 8[K : Q]" includes ℓ = 2, and every odd q is ≡ 1 mod 2; "odd prime ℓ" is meant.
- (iv) the scaling factor should be ℓ^d.
- (v) "character" should read "cocharacter".
- (vi) a gap in the proof at p = 2, like the roadmap's E7, repaired by putting 2 in S or by Dwork's trick (published pp. 964–965).
- (vii) "alternating square".

(iii) and (v) are corrected silently in /theorem-5-4 and /lemmas-2-4-2-5. The new records would start at E4.

## /12 (low, other): Lemma 2.2 at R01.1: not applied

This is a low finding, recorded only. Lemma 2.2 is general representation theory. Route 2 (or a new source route) should send it to ArithmeticGaloisRepresentations R01.1, and LV.1 should import it. Following the route rule, a new route would be appended.

## For the maintainer

These changes lie outside this job's deliverables.

- **Verdicts to record.** The next review of this extraction should give verdicts on:
  - routes 3 and 4 (new, appended);
  - the items routes 1 and 2 gained or lost;
  - the 28 new items;
  - the restated /good-model-gm, /monodromy-group, /lemma-3-1, /lemma-3-3, /crystalline-transport, /prop-3-4, /bakker-tsimerman, /lemma-2-6, /lemma-2-8, /lemma-2-12, /lemma-6-3 and /lemmas-8-2-8-3;
  - the Tate-algebra status (/5).
- **The extraction's review (/3).** In `papers/PAPER-LAWRENCE-VENKATESH-20.review.json` and `reviews/REV-PAPER-LAWRENCE-VENKATESH-20.md`, the notes "All compared statements match their items" and the gap sentence hold only because both copied the printed text. A dated correction there would match the fixed items.
- **Lawrence–Sawin (/2, /4).** Items /44 (their Lemma 6.3, routed to LD.6 by route 3) and /76 (planned at LD.6) should follow Bakker–Tsimerman to LogicAndDefinabilityPartII. Otherwise the corollary sits at LD.6, upstream of the theorem it needs.
  - Items /37, /41 and /70 should be reconciled with LV.1 as the owner of Serre's notions and of Lemma 2.6. The Part II may keep the disconnected-group form only as an extension of LV.1's statement.
  - Changes of target go on appended routes.
- **Ax–Schanuel (/2).** The Shimura and VHS theorems should have one owner. This fix chose LogicAndDefinabilityPartII. A HodgeStructures Part II is the alternative the verifier named.
  - When DESIGN-LogicAndDefinabilityInNumberTheoryPartII is regenerated, it should include route 4 of this file. `paper_designs` groups by parent, so this happens once route 4 is accepted.
- **Betts–Stix route 4 (/1).** Keep it at LV.3 as the owner of the general v-adic period map, beside this file's route 3. If the general §3 material is moved to a Part II instead, it should move with LV's general items.
- **The LV blueprint (/1, /4, /5).** Its packet is not a deliverable here. When it is next revised:
  - LV.1 should plan Lemma 2.6 for reductive G ⊂ GL_n, with the E28 repair, Richardson and H¹-finiteness nodes, and Serre's G-notions. Betts–Stix's GSp lemma is then a corollary.
  - LV.2–LV.4 should plan the general H^q case of route 3 and the compact dual H*.
  - The request to PadicHodgeTheory R06.5, "(the case i = 1 for abelian schemes suffices)", should be complemented by CP.2 with R06.2 for general smooth proper families.
  - New stage edges DWP.4, DWP.7 and R34.5 → LV.4 (purity of H^q), and SF.2 and ReductiveGroups Layer 6 → LV.1, when the general statements are added.
- **G-complete reducibility (/8, low).** One owner upstream of LV.1 and LP2, or LV.1 with LP2 citing it.
- **Errata register.** No source issue changed or was added, so `scripts/errata.py` has nothing new to collect. It was not run.

## Checks

- `python3 scripts/check_paper.py` on the two edited paper results: both `ok`.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- **`make_queue.accepted_routes`**, run read-only:
  - PAPER-LAWRENCE-VENKATESH-20 returns routes 1 (part-ii MordellLawrenceVenkateshPartII, 22 items) and 2 (source LV.1, 5 items). Routes 3 and 4 have no verdict and are not returned.
  - PAPER-BETTS-STIX-25 returns its seven routes unchanged.
- **Cycle test**, read-only, on the atlas that `scripts/build.py` assembles in memory (2,840 stages, 8,404 stage edges), plus the LV roadmap's `requires`.
  - The model adds placeholder nodes for LogicAndDefinabilityPartII (importing LD.0, LD.6 and HodgeStructures L3) and MordellLawrenceVenkateshPartII (importing that Part II, LV.1–LV.4, WC.2, R07.3, MC.6, R06.2, CP.2, AdicSpaces Layer 0, Chebotarev Layer 10, DWP.4, DWP.7 and R34.5).
  - New or confirmed edges:
    - C5, CR.2, CR.3 → LV.2;
    - R09.1 → LV.3;
    - CP.2, R06.2, SF.2, DWP.4, DWP.7, R34.5 → LV.4;
    - SF.2, DWP.1, R11.5, ReductiveGroups Layer 6 → LV.1;
    - C2, IG.3 → LV.8;
    - EDC.2, Chebotarev Layer 10 → LV.11 and LV.6.
  - No new edge has a reverse path, and the whole graph (2,515 nodes, 8,427 edges) is acyclic.
- **Sources read for this fix (30 September 2026).**
  - arXiv:1807.02721v3 (SHA-256 `e3013516…c6b9b`, the recorded hash).
  - The published Invent. Math. text as posted by BIMSA (SHA-256 `588e450a…db43bd`, the recorded hash), text extracted with pdftotext.
  - Bakker–Tsimerman, arXiv:1712.05088v1 (SHA-256 `a60d609e…cb49`).
  - Crossref records for the Richardson, Katz–Oda and Bakker–Tsimerman DOIs.
- **Citations.**
  - Every stage and node cited was read in `research/blueprint/atlas/roadmaps/`, `research/blueprint/roadmaps/MordellLawrenceVenkatesh.json`, `research/blueprint/packets/` or `data/decompositions/`.
  - The one Mathlib declaration newly cited (`Ideal.iInf_pow_eq_bot_of_isDomain`) was read at the pinned commit.
  - The Tau Ceti absences were checked in the pinned `declarations.tsv`.
- No Lean was run. The scratch files were deleted after the checks.
