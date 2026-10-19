# BP-ModularIwasawaMainConjectures — handoff

Refs #776. Claude (Opus 5.5), session `claude-5sHW61`, 18–19 October 2026. Branch
`claude-5sHW61-bp-modular-iwasawa-mc`. The bot confirmed the claim (issue comment 6256694915).
No second job was claimed.

## Deliverables

- `research/blueprint/packets/ModularIwasawaMainConjectures.json`: target-level packet, `"part": null`,
  status **complete**. 46 nodes (23 theorems, 8 definitions, 6 comparisons, 5 constructions, 2 lemmas,
  2 applications), 89 API items, 48 unit tests, 20 planets, 6 pinned baseline declarations, 10 requests,
  6 gaps, 3 source issues, 2 restructure proposals. All seven stages are **planned**; none is closed.
- `research/blueprint/readmes/ModularIwasawaMainConjectures.md`: the reader document. It has conventions,
  ownership, the import table, layer introductions, and every node with its statement, hypotheses, proof
  sketch, API, uses, unit tests, acceptance, prerequisites and sources. It is generated from the packet,
  so the two agree.
- `research/blueprint/suggested/ModularIwasawaMainConjectures.lean`: 172 lines. It contains the residual
  hypotheses as real-bodied predicates over Mathlib's `Representation`, the rank-one coinvariant lemma for
  a unipotent endomorphism of `O²`, the algebraic μ/λ lemma in `O⟦X⟧`, and `decide` checks of the
  examples. It has no sorry'd data definitions.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModularIwasawaMainConjectures.json --index $TAUCETI_BASELINE/declarations.tsv`:
  **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/ModularIwasawaMainConjectures.lean`: **exit 0**, eight
  `declaration uses 'sorry'` warnings and no others, at Mathlib 082e2d3 / Tau Ceti f790474. Memory was
  checked first (78 GB available). Nothing was left running.
- `python3 research/blueprint/intake.py check-files` on the four changed paths: see the pull request.
- A mechanical locator check was delegated to a Sonnet helper; see "Locator check" below.

## How the structure was decided

- **RS-11.** The accepted version (REV-RS-11, 29 September 2026) governs this plan, together with the
  FIX-RT-RS-11 amendments. The amendments are still unreviewed (issue #5710), but they keep the same three
  narrowings, so the plan is consistent with both versions:
  - L2 and L4 import Fouquet–Wan's pointwise and family endpoints from `AutomorphicCongruences:L4`.
  - L3 imports both Burungale–Castella–Skinner branches from `AutomorphicCongruences:L5b`.
  - L1 is the final assembly of `KatoEulerSystems:L4` with the reverse bound of `AutomorphicCongruences:L2`
    (Fouquet–Wan §4.8) or `AutomorphicCongruences:L1` (Skinner–Urban).
- **Imports, not duplicates.** The following are imported by node id; none is planned again here:
  - Greenberg's local condition, Selmer structures, Pontryagin duals, Poitou–Tate, Greenberg's
    no-finite-submodule theorem, and the Fitting/characteristic comparison: SelmerIwasawaCohomology.
    It is upstream as Tau Ceti PR #869.
  - Kato's zeta elements and divisibilities, including Rubin's Corollary III.5.17
    (`KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule`): KatoEulerSystems.
  - Coleman maps and Wach bases: PadicHodgeRegulators.
  - Canonical periods and p-adic L-functions: ModularSymbolsPadicLFunctions.
  - Characteristic ideals and determinants: PadicMeasuresIwasawaAlgebras, now TauCetiRoadmap's roadmap.
    It is cited by its atlas stage ids L1, L4 and L5.
  - Modularity: EllipticCurveModularity R29.4–R29.6.
  - The Manin constant: GZ.3.
  - The Iwasawa logarithm: `ColemanIntegration:L0/iwasawa-logarithm`.
  - The Tate curve: TauCetiRoadmap EllipticCurves layer 4.
- **Added sources** (the issue's list):
  - Skinner 2020 → `L5/rank-zero-converse` (PAPER-SKINNER-20/3).
  - Kolyvagin/Rubin Corollary 5.17 → imported into `L0/ordinary-selmer-structure` through the Kato node.
  - Rodrigues Jacinto–Williams → `L0/ordinary-main-conjecture`, `L5/tate-l-invariant`,
    `L5/mtt-padic-bsd-conjecture`, `L5/greenberg-stevens-trivial-zero`, `L5/schneider-padic-bsd-from-mc`
    and `L5/greenberg-and-coates-perrin-riou-instances` (items 35, 36, 37, 482, 534).
  - The Coates–Perrin-Riou existence proposition stays with `AutomorphicPadicLFunctions:L5` (RS-14), as a
    request.

## Red-team findings handed to this job

The same text is in the packet's `redteamHandling`.

- **RT-AREA-iwasawa-1/4.**
  - (a) `L1/skinner-multiplicative-theorem` is Skinner's Theorem A for p ∥ N. The restructure proposal
    puts it in a sub-layer `L1m`.
  - (b) Greenberg–Stevens is requested from `PadicFamilies:L3`; BSD.0 makes the same request.
  - (c) Barré-Sirieix–Diaz–Gramain–Philibert is requested from `DiophantineApproximationAndTranscendence:DT.5`.
  - (b) and (c) are used in `L5/greenberg-stevens-trivial-zero` and `L5/tate-l-invariant`.
- **RT-AREA-iwasawa-1/5.** Recorded as a gap on `L6/eisenstein-branch-interface`, and as a restructure
  proposal for a roadmap "Elliptic units and the Iwasawa main conjectures for imaginary quadratic fields".
  That roadmap is not created here.
- **RT-AREA-iwasawa-1/14.** `L1/su-ordinary-theorem` is the Skinner–Urban / Skinner Theorem 2.5.2 form,
  with integrality from a ramified q ∥ N; FW 1.6 is kept as `L1/fw-ordinary-theorem`.
  - **Correction to the finding's explanation:** Fouquet–Wan's ρ̄_f is the cohomological realisation
    (det = χ_cyc^{1−k}, as their Theorem 1.7 shows). Read that way, dim ρ̄^{G_ℓ} = 0 in weight two means
    *nonsplit* multiplicative reduction at ℓ. So FW 1.6 excludes every split auxiliary prime. The finding
    read the condition on E[p] (homological), which excludes only split primes with ℓ ≡ 1 mod p.
  - Its conclusion stands, and is stronger: 11a1 at p = 7 satisfies Skinner–Urban but not FW 1.6.
  - BSD.6 already consumes the SU form (its request is satisfied by `L1/su-ordinary-theorem`).
- **RT-AREA-iwasawa-1/17.** `L3/curve-form-lattice-dictionary` imports
  `GZ.3/manin-integrality-and-p-unit` and keeps every nonunit factor.
- **RT-AREA-iwasawa-1/22.**
  - `L1/fw-ordinary-theorem` follows FW §4.8: Theorem 7.32, Beilinson–Flach reciprocity, Poitou–Tate, and
    Castella–Wan 3.8 extended to weight k. This route is owned by `AutomorphicCongruences:L2`.
  - The Skinner–Urban route keeps SU's condition k ≡ 2 mod p − 1, so the Wan 2015 edge
    (`AutomorphicCongruences:L5w → L1`) is not needed.
  - The canonical/Gross period comparison is a recorded gap that the plan does not use.
- **RT-AREA-iwasawa-1/23.** L3 has `EllipticCurveModularity:R29.5/modular-parametrisation` and
  `R29.6/modularity-theorem` as prerequisites.

## Requests to other roadmaps

All ten are in the packet:

- `AutomorphicCongruences:L1`, `L2` and `L4`, with the exact endpoints and hypotheses. L4 is also asked to
  settle the scalar exclusion.
- `PadicMeasuresIwasawaAlgebras:L1`, `L4` and `L5`.
- `PadicFamilies:L3` (Greenberg–Stevens).
- `DiophantineApproximationAndTranscendence:DT.5` (q_E transcendence).
- TauCetiRoadmap EllipticCurves layer 4 (the Tate parameter and its p-th-power criterion).
- `AutomorphicPadicLFunctions:L5` (Coates–Perrin-Riou).

## Gaps and remaining work

1. **The p-adic height pairing has no owner.** The "SelmerIwasawaCohomology, Part II: p-adic heights"
   direction (review of PAPER-DISEGNI-LIU-24) is not yet a roadmap; its design issue is #3430.
   `L5/mtt-padic-bsd-conjecture` and `L5/schneider-padic-bsd-from-mc` cite NE.7's Nekovář height
   meanwhile.
2. **Schneider 1985 was not read** (not freely available). The exact leading-term statement must come
   from it or from Perrin-Riou's account.
3. **The scalar exclusion in Fouquet–Wan** (source issue E1) is kept as a hypothesis until
   `AutomorphicCongruences:L4` argues the scalar case.
4. **Ramification at 5 in the weight-4 example** (f = η(z)⁴η(5z)⁴ at p = 7) needs a cited weight-4
   Mazur-principle statement.
5. **Elliptic units / imaginary-quadratic main conjectures** (RT /5).
6. **The canonical/Gross period comparison** is not used.
7. **L1 remaining:**
   - Install sub-layer L1m.
   - For p = 3, Skinner's multiplicative theorem needs the Hida-family input at p = 3. The imported
     `R21.6` node is stated for p ≥ 5.

## Source issues (packet `sourceIssues`)

- **E1 (gap).** Fouquet–Wan Theorems 1.7 and 5.1 omit the scalar exclusion
  (ρ̄|G_{Q_p})^{ss} ≠ χ̄ ⊕ χ̄. Their standing Assumption 2.1(2) and Theorem 1.1 include it.
- **E2 (error, affects nothing).** The remark after FW Theorem 1.1 claims Assumption 3 is equivalent to an
  explicit twisted-Steinberg form. That equivalence holds only in weight two.
- **E3 (misprint).** FW cite Skinner–Urban's ordinary theorem as Theorem 3.19 in one place and 3.29 in
  another. In the authors' copy it is Theorem 3.6.4.

## Notes for the reviewer

- **Locators in the roadmap's README do not match the source.** The atlas README cites "LLZ Theorem 5.10"
  and "Theorem 5.13", which do not match LLZ arXiv v3. The plan cites v3 numbers:
  - Corollary 6.6: the signed reformulation.
  - Theorem 4.28 and Corollaries 5.18/5.22: the Coleman images.
  - Proposition 5.10 and Corollary 5.11: the a_p = 0 comparison.
- **Fouquet–Wan versions.** The intro Theorem 1.7 is stated for μ nontrivial; the body Theorem 5.1 allows
  μ trivial when ρ̄|G_{Q_p} is reducible, and level Np^r. `L2/fw-pointwise-theorem` uses the 5.1 form.
  Example: 11a1 at p = 7 is covered by 5.1 but not by 1.7.
- **Worked examples.** The curve data were computed by point counting on the minimal models and matched
  against LMFDB's curve data (ainvs, discriminants, torsion, isogeny degrees, nonmaximal primes, Manin
  constants):
  - 11a1: Δ = −11⁵, split.
  - 14a1: Δ = −2⁶·7³, nonsplit at 2, split at 7.
- **Weight-4 data.** The q-expansion of η⁴(z)η⁴(5z) was computed and its Hecke relations checked. Residual
  irreducibility at 7 and 11 was checked against every Eisenstein-type trace pattern; at 13 the form is
  Eisenstein.
- **Mathlib.** It has no p-adic logarithm, Galois cohomology of number fields, characteristic ideals or
  p-adic L-functions at the pin. Every arithmetic object is therefore a README target, and the Lean file
  states only what the pins support.

## Locator check

A Sonnet helper scripted a check of every source locator and `readSections` range against the downloaded
texts (PDF-page and printed-page offsets per source). It found:

- one wrong section page (Colmez §0.3);
- one mislabel (LLZ 5.18 and 5.20 are corollaries);
- one section reference (SU §3.4) and about a dozen Fouquet–Wan locators one page off.

I re-checked each one against the texts and corrected it. A rerun leaves four flags, all checked by hand
and correct as cited:

- OCR renders Kato's "Theorem 17.4" as "17A" on printed p.273.
- Three items whose cited content sits on the page after the heading.

## Sources read

All were read on 18 October 2026; URLs and SHA-256 hashes are in the packet:

- Fouquet–Wan arXiv:2107.13726v3 (§§1, 2.1, 3.1–3.4, 4.6–4.8, 5.1).
- Skinner–Urban, authors' copy (§§1, 3.2, 3.5–3.6).
- Skinner arXiv:1407.1093v1 (§§1, 2.4–2.5, 3.1).
- Skinner arXiv:1405.7294 (§1).
- Burungale–Castella–Skinner arXiv:2405.00270v2 (§1).
- Lei–Loeffler–Zerbes arXiv:0912.1263v3 (§§1.2, 3.3, 4.5, 5.2–5.3, 6).
- Rodrigues Jacinto–Williams arXiv:2309.15692v2 (§2.2, §13.5.3, App. B).
- Kato, Astérisque 295, Numdam (§§12.10, 17.4–17.6, 17.13).
- Rubin, *Euler systems*, draft (III §5).
- Colmez, Bourbaki exposé 919, Numdam (§0).

**Missing:**

- Schneider 1985.
- Kobayashi 2003. Not needed: LLZ §5.3 supplies the comparison.
- Greenberg–Stevens 1993 and Mazur–Tate–Teitelbaum 1986. Cited only through Colmez and the requests.

No source text is copied into the repository.
