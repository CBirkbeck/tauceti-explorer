# PAPER-TEMKIN-17: Tame distillation and desingularization by p-alterations

Michael Temkin, *Tame distillation and desingularization by p-alterations*, Ann. of Math. 186 (2017), 97–126 ([doi](https://doi.org/10.4007/annals.2017.186.1.3), [arXiv:1508.06255](https://arxiv.org/abs/1508.06255v2)).

Extraction by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #1155). Status: **complete**. Every missing item is routed exactly once.

The machine-readable extraction is [PAPER-TEMKIN-17.result.json](PAPER-TEMKIN-17.result.json). It has:
- 64 items: 4 library, 5 planned, 55 missing;
- 3 routes: a new Part II, a Part II that coalesces with an existing proposal, and one source route;
- 12 prerequisite entries;
- 3 source issues.

## Source read

The published Annals article, pp. 97–126 (SHA-256 `1f4ac06f…`), freely available from the journal and read completely. Locators are its page numbers.

arXiv:1508.06255v2 ("final version", 21 February 2017) was compared: its statements and numbering are the same.

## What the paper proves

**Theorem 1.2.5.**
- Setting: X admits a finite-type morphism to a quasi-excellent scheme of dimension ≤ 3, and Z ⊂ X is nowhere dense.
- Conclusion: there is a projective char(X)-alteration X′ → X with X′ regular and the preimage of Z an snc divisor. Its degree is divisible only by primes that are residue characteristics of X.
- Over a perfect field the alteration can be separable.
- It relies on Cossart–Piltant's resolution of qe threefolds.

**Theorem 1.2.9 (desingularization of morphisms).** A maximally dominating f : X → S of finite type over a qe threefold becomes log smooth, (X′, Z′) → (S′, W′), after char(S)-alterations of both sides.

**The general form, Theorem 4.3.1.**
- If S is universally P-resolvable and char(S) ⊆ P, then X is universally P-resolvable.
- Its morphisms admit log-smooth P-altered desingularization.

This generalizes Gabber's ℓ′ theorems from P = {ℓ}′ to any P containing the residue characteristics.

**Method.**
1. **Tameness theorem (§2, Theorem 2.6.6).** A valued field with no nontrivial p-extension is tame.
   - Height one follows from Pank's splitting k^a = k^t ⊗ k_w for henselian fields, by decompletion (Lemma 2.5.2: Krasner's lemma plus density of k in k^h).
   - Higher height follows by induction through composed valuations (Lemma 2.6.3, Corollary 2.6.4).
   - The general case follows by descent to finitely generated subfields.
2. **Tame distillation for fields (§3.2, Theorem 3.2.12).** On a constructibly compact set S of valuations, a finite L/K becomes S-tame over a P-extension K′/K, where P is the set of wild primes. This uses:
   - Riemann–Zariski spaces RZ_K(X) ≅ Val_K(X): compactness and openness of restriction maps (§3.1);
   - the openness of tame loci (Lemma 3.2.10).
3. **Tame distillation of alterations (§3.3, Theorem 3.3.6).** After enlarging, any alteration factors as a tame Galois covering followed by a P^w-alteration.
4. **Desingularization (§4).** Gabber's proof (Illusie–Temkin, Exposé X) goes through with Sylow subgroups replaced by distillation. That gives Theorem 4.2.1 (relative curves) and Theorem 4.3.1.

## What the atlas and libraries already have

- **Library (4 items).** Mathlib has:
  - valuations, valuation rings and valuation subrings;
  - the primitive element theorem;
  - the valuative criterion of properness (`AlgebraicGeometry.IsProper.eq_valuativeCriterion`);
  - the local structure of étale algebras (`Algebra.IsEtaleAt.exists_isStandardEtale`, Stacks 00UE).
- **Planned (5 items).**
  - AdicCoefficientsAndComparisons L5 plans de Jong's alteration theorem, flattening by blow-up, normalization under excellence and semistable reduction of curve families.
  - CrystallineCohomology CR.5:log-algebra plans Kato's chart criterion, which specializes to the log-smoothness criterion of §1.2.7.
- **Not planned anywhere.**
  - Ramification theory of Krull-valued fields: Tau Ceti LocalFieldsRamification treats local fields only, and AdicSpaces Layer 1 treats valuation spectra.
  - Riemann–Zariski spaces of schemes.
  - Tame distillation.
  - Degree-controlled alterations, which are only proposed (PrimeToDegreeAlterations).

## Routes

1. **Part II `PrimeToDegreeAlterations`, "Adic coefficients and comparison with schemes, Part II: prime-to-degree alterations" (26 items).**
   - Coalesced with the proposal of PAPER-DITTMANN-POP-23 and PAPER-JANNSEN-16, whose briefs ask for Gabber's ℓ′-alterations; DESIGN-AdicCoefficientsAndComparisonsPartII is pending.
   - Temkin's P-alterations are the general form, so they join, together with the Riemann–Zariski spaces, tame loci, tame distillation (Theorems 3.2.12, 3.3.6), Gabber's modification theorem and the desingularization theorems.
2. **New Part II `LocalFieldsPartIIGeneralValuedFields`, "Local fields and ramification, Part II: ramification theory of general valued fields" (27 items).**
   - It covers §2 in full:
     - P-extensions, henselian valued fields and henselization;
     - the basic ramification tower with its six properties;
     - tame fields and the tame closure;
     - the splitting reformulations and Pank's theorem;
     - Krasner and decompletion;
     - composed valuations;
     - the tameness theorem.
   - This theory is reusable beyond alterations, for example in the model theory of valued fields, so it is a Part II of the Tau Ceti local-fields roadmap rather than part of the alterations route.
3. **Source of CrystallineCohomology CR.5:log-algebra (2 items).** The log structure O_X ∩ i_*O_U^× of a divisor, and Kato's log regular log schemes.

## Prerequisites not covered by the atlas

All DOIs were checked through Crossref; Gabber's seminar is arXiv:1207.3648.
- **Alterations:** Illusie–Temkin, Exposés VIII and X of Gabber's seminar; de Jong 1996; Temkin 2010 (Riemann–Zariski spaces).
- **Pank's theorem:** Kuhlmann–Pank–Roquette 1986 and Ershov 2008.
- **Resolution:** Cossart–Piltant (arXiv:1412.0868 and 2009), Lipman 1978.
- **Other inputs:** Kato 1994 (log regularity), Raynaud–Gruson 1971 (flattening), Brink 2006 (continuity of roots).

## Source issues

| id | kind | where | finding |
|----|------|-------|---------|
| E1 | gap | Theorem 4.2.1, Step 4 | The theorem assumes only char(X) ⊆ P. Step 4 applies Theorem 3.3.6 to S̄ → S, which yields a P^w-alteration with P^w ⊆ char(S); that need not be a P-alteration when S̄ → S is wildly ramified over fibres where X is empty. Two repairs: assume char(S) ⊆ P, as Theorem 4.3.1 does, the only place the theorem is used; or distill over S₀ = S minus the finitely many fibres over char(S) ∖ char(X), then extend. |
| E2 | misprint | Lemma 3.3.7, proof | "Direct" and "inverse" are swapped, S′ should be S, and "L is the composite …, L/K is tame" should be L′. |
| E3 | misprint | Theorem 2.6.6, proof | "Corollary 2.5.6(ii)" should be "Corollary 2.5.6", which has no part (ii). |

- All three are in both arXiv v2 and the Annals text.
- None affects Theorems 1.2.5, 1.2.9 or 4.3.1.
- No erratum was found. This is not an exhaustive novelty claim.
