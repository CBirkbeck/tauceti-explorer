# RT-PAPER-BERGSTROM-FABER-PAYNE-24: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4973, job
FIX-RT-PAPER-BERGSTROM-FABER-PAYNE-24).
- **Findings:** `RT-PAPER-BERGSTROM-FABER-PAYNE-24.result.json`.
- **Verdicts:** `RT-PAPER-BERGSTROM-FABER-PAYNE-24.review.json`. The red team has ten findings, all confirmed.
  This job applies the seven the issue lists: two high (/1, /2) and five medium (/3–/7). The three low
  findings are not part of it. The verifier corrected the fix of every one of the seven, and I applied the
  corrected version each time.
- **Files changed:**
  - `papers/PAPER-BERGSTROM-FABER-PAYNE-24.result.json`;
  - `papers/PAPER-BERGSTROM-FABER-PAYNE-24.md`: the header counts, the "What the atlas and libraries already
    have" section and one route-1 bullet, plus a new closing section.
- **Result:**
  - 87 items (3 library, 7 planned, 77 missing), up from 80;
  - nine routes, up from five;
  - seven source issues.
- **Independence.** I did none of:
  - the extraction (cc-39fac3);
  - its review (cc-fb70e5);
  - the red team (cc-f805bf);
  - the verification (cc-48533a).

## /1 (high, duplicate): the moduli stacks have one owner, StableReductionPartII

- **`moduli-stacks` is split, as the verifier asked.** It is not stripped: the paper uses the stack clauses.
  - It now states Knudsen's theorem for all g, n ≥ 0 with 2g − 2 + n > 0: smooth proper DM stacks over Z, a
    boundary with normal crossings relative to Z, and the universal curve M̄_{g,n+1} → M̄_{g,n}.
  - It moves with `boggi-pikaart` to a new route 6: part-ii, StableReductionPartII, with the parent, title and
    area of PAPER-YUAN-26 route 10.
  - Route 6's brief is the verifier's text. It is the pending YUAN-26 Part II, binding with the pointed range of
    FIX-RT-AREA-etale /4. It needs M̄_{g,n} for all 2g − 2 + n > 0 and Boggi–Pikaart over the base the source
    proves, and it exports both to MotivicStructuresInModuliOfCurves.
- **New item `boundary-strata`** (§4, Notation 4.1 and the proof of Proposition 4.2, pp. 6–7) stays in route 1. It
  covers:
  - the stratification by marked dual graphs;
  - the open strata M_G = (∏ M_{g_v,n_v})/Aut(G);
  - the closed strata M̃_G, with H^•(M̃_G) the plain invariants.
- **`boggi-pikaart` is restated as the paper states it:**
  - a "smooth and proper" X_{g,n};
  - used over F_q for the twisted forms of Remark 9.4, and over Q for §1.

  The extraction's "smooth projective … over Q" is gone. The verifier asked for the base ring and projectivity
  to be taken from BP00 (Compositio 120 (2000) 171–191). I could not obtain it, since Springer's page redirects
  to a login. The item's note and route 6's brief ("over the base the source proves") leave that for the
  design.
- **Route 1.** Its brief imports the stacks, properness, smoothness, the normal-crossings boundary and the
  Boggi–Pikaart presentation from StableReductionPartII. Its reason no longer says "The atlas has no moduli of
  curves".
- **The report.** The .md says the same.

**For the maintainer.**
- Record a verdict for route 6 in `PAPER-BERGSTROM-FABER-PAYNE-24.review.json`, which this job may not edit, so
  that make_queue applies it. The verifier suggests `{"route": 6, "verdict": "accept", "reason": "Applies
  confirmed RT-PAPER-BERGSTROM-FABER-PAYNE-24/1 and RT-AREA-etale/4."}`.
- Apply FIX-RT-AREA-etale's Edit 1, the pointed range in PAPER-YUAN-26 route 10, with this route or before it.
  At the current main, that brief still reads "for g>1", so the imported object does not yet cover g ≤ 1 or
  n > 0.

## /2 (high, error): the E₁ page carries det E(G)

- **`weight-spectral-sequence` is restated:**
  - E₁^{j,k} = ⊕_{|E(G)|=j} (H^k(∏_v M̄_{g_v,n_v}) ⊗ det E(G))^{Aut(G)} = H^k(D̃^{(j)}, ε^j), abutting to
    H^{j+k}_c(M_{g,n});
  - it degenerates at E₂;
  - Payne–Willwacher §2.3 and Deligne, Hodge II §3.2 (dual form) are cited;
  - the Galois clause is kept (Petersen Ex. 3.5), and the item adds that Frobenius acts trivially on det E(G),
    as the verifier asked.

  Its note records the M_{1,2} counterexample, and that one-edge columns have no sign.
- **New source issue E7** (kind `error`):
  - the printed text, the correction (including "M_{g,n}" → "M_{g′,n′}"), the reason and `affects: nothing`;
  - an impact paragraph saying Propositions 4.2 and 9.5 hold, and that the closing sentence of §4 refers to the
    open strata;
  - `known`: new, since the cited [PW21 §2.3] has the twist;
  - the search record (arXiv v2 is the last version; Crossref and the Annals page show no erratum; the Annals
    text was not collated).

  I did not recompute the counterexample. Its values and the point counts are the red team's and the
  verifier's, which the verifier checked by computer for p = 5, …, 19; the entry cites them as such.
- **Route 3 (DWP.8)'s reason** records the orientation local system.
- **Route 1's brief** follows the verifier's replacement of the finding's part (3). Only the E₁ page, summing over
  the closed strata M̃_G, carries det E(G). The open-strata decomposition, Proposition 4.2(3) and the
  Getzler–Kapranov formula take plain invariants.
- **Not added:** the finding's "every graph sum over boundary strata is taken with det E(G)". The verifier showed
  it would corrupt the point counts: for (1, 2), the double-edge stratum must count 1.

## /3 (medium, duplicate): Poincaré duality is split

The verifier rejected SF.2 as owner, because its text owns no duality, and replaced the fix.
- **New item `poincare-duality-equivariant`** holds the scheme statement of Remark 9.4, first paragraph. It stays
  in route 2 at WC.2. Its note says the pairing is EDC.2:pairings, WC.2 derives b_i = b_{2d−i}, G-equivariance
  comes by naturality, and P_{V,i} = [H^{2i} : V] by Proposition 9.3.
- **`poincare-duality-dm` is now the DM-stack statement:** a Frobenius- and G-equivariant perfect pairing for a
  smooth proper DM stack or its coarse space (Remark 9.4, second paragraph). Its note records:
  - that it is the same theorem as CANNING-LARSON-PAYNE-24/14;
  - the reduction to schemes by Boggi–Pikaart.
- **New route 7** sends `poincare-duality-dm` to part-ii EtaleDualityAndPerverseSheavesPartIIStacks, with parent
  EtaleDualityAndPerverseSheaves. FIX-RT-AREA-etale /3 recommends this Part II as the one owner of sheaf theory on
  stacks, and the route uses that report's title and area. Its brief:
  - defers to that proposal's brief;
  - asks at ST.1–ST.2 for the equivariant pairing and the coarse-space comparison;
  - imports EDC.2:pairings;
  - says CLP-24/14 belongs there too.
- **Route 2's reason** drops "DM-stack form".

**For the maintainer.**
- No accepted route yet proposes the stacks Part II. FIX-RT-AREA-etale placed its first route in
  PAPER-LAFFORGUE-18 as a maintainer edit, not yet applied. Record a verdict for route 7 here, and move
  CLP-24/14 there too, as FIX-RT-AREA-etale recommends.
- If the maintainer declines that Part II, the verifier's rule applies: `poincare-duality-dm` follows whatever
  CLP-24/14 then cites, so that no third owner appears.

## /4 (medium, duplicate): the squarefree count's owner is FF.3

The verifier corrected the owner. FF.3 plans the counting theory of polynomials over F_q
(FF.3/gauss-count-formula, the prime polynomial theorem), so it is the foundational owner rather than ST.4, which
is Selmer groups.
- `squarefree-count` stays missing in route 4 at FF.3.
- Its note now names FF.3 as the owner of s_n and says the ST.4 node duplicates it. It gives
  #P_g = (q − 1)(s_{2g+2} + s_{2g+1}); the verifier checked g = 0.
- Route 4's reason says why FF.3 owns the count.

**For the maintainer.**
- Move ArithmeticStatistics:ST.4/count-of-squarefree-monic-polynomials-over-a-finite-field into the FF packet at
  FF.3.
- Route WOOD-19/89 to FF.3. EVW-16/89 then imports it.
- If the maintainer keeps ST.4 as the owner instead, the red team's original fix applies. Either way there must be
  one owner.

## /5 (medium, error): purity

- **`deligne-purity`** is now planned at WeilConjectures:WC.6 and DeligneWeightsAndPurity:DWP.7, not WC.3. WC.3
  covers only the projective case. Its note names the integrated nodes WC.6/purity-for-proper-smooth-varieties and
  DWP.7/…-3-3-7-3-3-11 (Weil II 3.3.9, 3.3.11).
- **New missing item `deligne-purity-dm`,** as the verifier refined it. It states purity for a smooth proper DM
  stack over F_q by one of two routes:
  - through the coarse space: Rπ_*Q_ℓ = Q_ℓ, and Weil II 3.3.11 for a space étale-locally a finite quotient of a
    smooth scheme;
  - through H^i(Y)^H when a global quotient [Y/H] exists. The note says this is not general.

  Its locators are the proofs of Propositions 3.1 and 4.2. It is routed in route 2 as a source of WC.6, which is
  added to route 2's stages, and it imports the coarse-space comparison from the stacks Part II.
- The notes of `vdbe-lemma-4-1`, `prop-3-1` and `vdbe-theorem-2-1` cite it. Following the verifier, the planned
  item is not widened: neither WC.6 nor DWP.7 plans the stack case.

## /6 (medium, missing): Lemma 2.6 and the pure-Tate remark

The verifier replaced the fix, so no new item was added.
- **`ac-lemma-2-6`'s note** now derives Lemma 2.6 as the (0, k) corner of the weight spectral sequence:
  ker = E_2^{0,k} = gr^W_k H^k_c, and one-edge graphs carry no sign. Its inputs are weight-spectral-sequence,
  deligne-purity-dm and etale-singular-comparison. It says why the formalization follows the ℓ-adic route and not
  Hodge III 8.2.5.
- **Route 1's brief** adds, after Lemma 2.6, "(derived from DWP.8's weight spectral sequence, not from Hodge III)".
- **`pure-tate`'s note** names its inputs:
  - Boggi–Pikaart, which gives a pure Hodge structure on H^•(Y)^H;
  - the Hodge decomposition of smooth projective complex varieties, found only in the draft
    SeveralComplexVariablesKahlerGeometry CV.5, with Tau Ceti HodgeStructures L0;
  - the Hodge–Tate comparison CohomologyComparisons CP.3, or Katz's E-polynomial theorem.

  Route 1's brief records the CV.5 dependency as an import gap.

## /7 (medium, missing): the ring §§9 and 11 compute in

The verifier corrected all four parts of the fix, and I followed its version.
- **`representation-ring` is library,** not planned. It cites `tauceti:TauCeti.repRing`, `repRingCharacter`,
  `range_repRingCharacter` and `repRingCharacter_injective`. I read each at f790474 (Basic.lean:106/127/157;
  Injective.lean:50). The note records that `repRing` is the split K₀, which agrees with R(G) for a finite group
  whose order is invertible in k, and that injectivity needs [Finite G] [CharZero k].
- **`frobenius-characteristic` is planned** at Tau Ceti SchurWeyl L7, which covers the fixed degree and finitely
  many variables.
  - The note lists the library ingredients, each checked in the pinned index: TauCeti.schurPoly, spechtChar,
    symmetricCharacterTable and partitionEquivSimpleModuleClasses, and Mathlib's MvPolynomial.psum and psumPart.
  - It also records that ch itself is not in either library.
- **`symmetric-functions-and-plethysm` is missing** and goes to a new route 8, part-ii SchurWeylSymmetricFunctionsPartII
  of Tau Ceti SchurWeyl. It covers Λ and Λ̂, the stable characteristic ⊕_n R(S_n) ≅ Λ, and plethysm with
  ψ_k = p_k ∘ − and p_n ∘ q = q^n.
  - The title is "…, Part II: the ring of symmetric functions, the stable Frobenius characteristic and plethysm".
  - The brief starts where L7 stops. It imports the λ-ring axiomatics from KTheoryLowDegrees Z.3 and Exp/Log from
    QM.0.
  - It names MotivicStructuresInModuliOfCurves and HabiroRings (its free Λ-ring gap) as consumers.
  - It says the route is distinct from SchurWeylIntegralFunctors (CADORET-HUI-TAMAGAWA-17 route 3).
  - The brief's plethysm acceptance test p_2 ∘ s_{1,1} = s_{2,2} − s_{2,1,1} + s_{1,1,1,1} was checked by a
    computer expansion in four variables.
- **`plethystic-exp-log` is missing** and goes to a new route 9, a source route to
  QSeriesPartitionsAndMockModularForms:QM.0. QM.0 already owns plethystic operations through PAPER-YU-23's
  accepted route 7 (item 044), so the construction is stated once, for a complete filtered ring with Adams
  operations. The verifier asked for one owner without naming it. I chose QM.0 because it is an existing atlas
  stage with an accepted route.
- **Route 1's brief** imports R(G), the fixed-degree characteristic, Λ and plethysm, and Exp/Log from those owners.
  Stable S-modules, Ch, the Laplacian Δ and Getzler–Kapranov's Theorem 8.13 stay in route 1.
- **Notes updated:** `def-9-1`, `cor-9-5`, `theorem-11-1` and `getzler-kapranov`.
- **`local-systems`** now cites Tau Ceti ClassicalGroups Layer 3, the highest weights of Sp_n, and LieHighestWeight
  Layer 4. It also cites the accepted ClassicalGroupsPartII of PAPER-YU-23 (route 13, rational representations of
  split GSp_2g).

**For the maintainer.**
- Record verdicts for routes 8 and 9.
- PAPER-SCHIFFMANN-16/5 and HabiroNahmSeries:HB.8/integral-plethystic-logarithm should import `plethystic-exp-log`'s
  owner, QM.0, so that Exp/Log has one owner.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-BERGSTROM-FABER-PAYNE-24.result.json`: ok.
  Every missing item is routed exactly once, and no planned or library item is on a route.
- `source_issues.check_issues` and `check_errata.versions_checked` on the file: no errors.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- The JSON keeps the file's own formatting (indent 1, UTF-8).
- The paper was not re-read beyond the verifier's quotations. The Annals text, BP00 and Payne–Willwacher were not
  read by me; their use is as the verifier read them.
