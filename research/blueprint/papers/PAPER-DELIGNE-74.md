# PAPER-DELIGNE-74: Deligne, *La conjecture de Weil. I*

Pierre Deligne, "La conjecture de Weil. I", *Publications mathématiques de l'IHÉS* 43 (1974), 273–307, doi:10.1007/BF02684373.
Extraction by Claude Code (session `cc-f805bf`), 29 September 2026, issue #4492.

## What was read

I read the published text, the Numdam scan (36 pages; SHA-256 `8392b345…42e5`, fetched 29 September 2026), in full: §§1–8 and the bibliography.

- **Page images.** Numdam's text layer is OCR and garbles almost every formula. Every statement and every quoted misprint was therefore read on rendered page images, and doubtful subscripts were read at 300–600 dpi.
- **Cross-check.** E. Goncharov's English translation (arXiv:1807.10810v2) was used as a cross-check only. It is not the author's version.
- **Corrections in print.** No published erratum to Weil I is known.

## What the paper proves

The main theorem (1.6) concerns a smooth projective variety X₀ over F_q. For each i, the characteristic polynomial of Frobenius on H^i(X, Q_ℓ) has integer coefficients independent of ℓ ≠ p, and every complex root has absolute value q^{i/2}.

**§1.** Grothendieck's cohomological rationality reduces (1.6) to Lemma (1.7): the eigenvalues of Frobenius are algebraic, with all complex conjugates of absolute value q^{i/2}. The reduction uses the Hankel-determinant, Fatou and Gauss steps. The proof of (1.7) runs through §§3–7.

**§§1–2 (recalls).** Grothendieck's ℓ-adic theory, following SGA 4, 5 and 7:
- constructible and lisse Q_ℓ-sheaves;
- the conventions for geometric Frobenius;
- the trace formula (1.5)/(1.12.1), and L-functions of sheaves with their cohomological expression (1.14.3);
- Tate twists;
- Poincaré duality and the functional equation, with its sign.

**§3 (original).** The fundamental estimate (3.2), for a lisse sheaf ℱ₀ on a curve U₀ with three properties:
- a nondegenerate alternating pairing to Q_ℓ(−β);
- geometric monodromy open in the symplectic group;
- local factors with rational coefficients.

Such a sheaf is pure of weight β. The proof is Rankin's trick. Even tensor powers have local factors with positive coefficients, the Sp-invariant theory locates the only pole of the zeta function, and letting the power grow gives the bound. Corollaries (3.8)–(3.9) bound the weights of H¹_c and H¹.

**§§4–5 (recalls).** Local Picard–Lefschetz theory (complex model and ℓ-adic theory over a henselian trait), then Lefschetz pencils and global vanishing cycles. The key results are:
- conjugacy of the vanishing cycles (5.4);
- absolute irreducibility of E/(E∩E^⊥) (5.5);
- the Kazhdan–Margulis theorem that the monodromy is open in Sp for n odd (5.10).

The whole argument avoids hard Lefschetz by working with the radical quotient E/(E∩E^⊥).

**§6 (original).** The local factors of E/(E∩E^⊥) on the pencil's base have rational coefficients (6.2). The proof uses a Čebotarev-density argument with the arithmetic monodromy in CSp.

**§7 (original).** Lemma (7.1) is proved by induction on the dimension through a Lefschetz pencil (after blowing up the axis), with three cases according to the position of the vanishing cycles. The resulting estimate q^{d/2 ± 1/2} is sharpened to q^{d/2} by applying it to X^k and letting k → ∞ (7.3).

**§8 (original applications).**
- (8.1): point counts of smooth complete intersections.
- (8.2): the Ramanujan–Petersson conjecture for newforms of weight k ≥ 2, via Deligne's 1969 Kuga–Sato realisation.
- (8.3): a remark on weight one.
- (8.4): Bombieri's bound |Σψ(Q(x))| ≤ (d−1)ⁿq^{n/2}, for Q of degree d prime to p with smooth leading form. Its proof uses Artin–Schreier sheaves, Lemma (8.5), a smooth compactification by Zariski's resolution, a Künneth reduction to x^d, the Grothendieck–Ogg–Shafarevich formula and a Swan-conductor computation (8.12)–(8.13).

## What the atlas already has

The extraction has 208 items: 165 are `planned`, 1 is `library` and 42 are `missing`. The atlas was built for this proof, and the planned items concentrate where one would expect:

| Part of the paper | Stages that plan it |
|---|---|
| §3 fundamental estimate | DeligneWeightsAndPurity DWP.2 (23 items), DWP.0 (weights) |
| §6 rationality | DWP.3 (20 items) |
| §7 induction and tensor-power trick | DWP.4 (19 items), with LPV.3 and EDC.4 |
| §4 ℓ-adic Picard–Lefschetz | LefschetzPencilsAndVanishingCycles LPV.0–LPV.2 |
| §5 pencils, conjugacy, irreducibility, Kazhdan–Margulis | LPV.3–LPV.5 |
| (1.6), (1.7)⇒(1.6), functional equation | WeilConjectures WC.1–WC.3 |
| §2 duality | EtaleDualityAndPerverseSheaves EDC.1–EDC.2, WC.2 |
| §1 trace formula and ℓ-adic formalism | SchemeAndStackFoundations SF.2 with WC.0/WC.1 and EDC.0 (see below) |
| Tate twists, Frobenius conventions | DWP.0 and WeightsInEtaleCohomology R34.1 |
| (8.2) Ramanujan–Petersson | AutomorphicGaloisRepresentations R19.1/R19.3, R34.6 |

**The §1 formalism.** The atlas does not stage the trace formula, sheaf L-functions, constructible sheaves or finiteness of H_c. It imports them from the upstream CohomologicalPointCounting supplier ("PR196"), whose layers have no atlas ids. SF.2 "Integrate[s] CohomologicalPointCounting suppliers", and WC.0/WC.1 reconcile and consume them. I marked these items `planned` at SF.2 and WC.0/WC.1, as the accepted extractions PAPER-SCHMIDT-STIX-16, PAPER-BERGSTROM-FABER-PAYNE-24 and PAPER-LIU-WOOD-ZUREICKBROWN-24 did. The item notes say so. The source of that supplier is listed among the prerequisites below.

**Library.** The only `library` item is the notion of a primitive form with character used in (8.2). It rests on Tau Ceti's `cuspFormCharSpace`, `mem_cuspFormCharSpace_iff_nebentypus`, `TauCeti.cuspFormsNew` and `HeckeRing.GL2.IsEigenformAwayFromLevel`. Nothing else in the paper is in Mathlib or Tau Ceti at the pinned commits. There are no Lefschetz pencils, vanishing cycles, ℓ-adic sheaves, ℓ-adic Lie groups or CSp similitude groups.

## Routes

All 42 missing items go to existing campaign layers as sources. No Part II or new roadmap is needed, because each missing item is a step or worked example of a layer that already plans the surrounding mathematics.

1. **WeilConjectures (WC.1, WC.5). 3 items.** WC.1 gets the Hasse–Weil zeta function (1.1.1) of a scheme of finite type over Z; Z(X₀, t) is its finite-field case. WC.5 gets Theorem (8.1): |#X₀(F_q) − #Pⁿ(F_q)| ≤ b·q^{n/2} for a smooth complete intersection, with the complete-intersection cohomology it uses. WC.5 plans exactly this point-count estimate, and (8.1) is its instance where only the primitive middle cohomology survives.
2. **DeligneWeightsAndPurity (DWP.2, DWP.3). 4 items.** Four small inputs of the proofs of (3.2) and (6.2) that no layer states:
   - Zariski density of an open subgroup of Sp(Q_ℓ);
   - H⁰_c = 0 on an affine curve;
   - at most qⁿ closed points of degree n on A¹;
   - the homotopy exact sequence π₁(U) → π₁(U₀) → Ẑ.
3. **LefschetzPencilsAndVanishingCycles (LPV.0, LPV.2–LPV.4). 13 items.**
   - The complex-analytic model of (4.1): specialization, monodromy, the five-term sequence, Picard–Lefschetz, and transvection versus reflection. This is the comparison LPV.2 asks for when it checks the n mod 4 sign table "against complex comparison".
   - The description (4.2) of sheaves on a henselian trait.
   - The complex statements (5.1)–(5.2): general axis, and loops generating π₁.
   - Remark (5.12): hypersurfaces, and the sketch for odd-dimensional ones.
4. **FiniteFieldsAndCharacterSums (FF.2). 20 items.** FF.2 plans the headline "exponential-sum bounds via curves and l-adic trace functions", with DELIGNE as its source. Weil I contains the entire proof of Bombieri's bound (8.4):
   - the Artin–Schreier sheaves ℱ_j and their trace formula;
   - Lemma (8.5) (i)–(iii);
   - the compactification (8.6)–(8.9) by Zariski's resolution;
   - local constancy and Künneth separation (8.10);
   - the case n = 1 and the Grothendieck–Ogg–Shafarevich formula (8.11).
5. **ArithmeticGaloisRepresentations (R01.3). 2 items.** Lemmas (8.12)–(8.13): an Artin–Schreier character of an extension T^p − T = y⁻¹ with v(y) = d prime to p has conductor d + 1, so ℱ_j has Swan conductor d at infinity. This is the natural worked example for R01.3's Artin and Swan conductors.

## Mistakes in the paper (`sourceIssues`)

Twenty-five candidates were checked on the page images, and fifteen were confirmed. Candidates came from the extraction and from the footnotes of the English translation. None changes a stated result. Items use the corrected statements.

- **E1–E4 and E6–E14 are misprints.** They include:
  - (1.5.3) printed for (1.5.4);
  - "point fermé de X" for U₀;
  - H¹ for H¹_c in the zeta formula of (3.7);
  - "F = E" for F = E⊗C in (5.5);
  - "unités p-adiques" for ℓ-adiques, and ∏ᵢ δᵢ for ∏ⱼ δⱼ in (6.8);
  - the letter n doing double duty in the definition of H in (6.10);
  - β_j for δ_j in (6.13);
  - the upper bound q^{kd/2−1/2} for q^{kd/2+1/2} in (7.3);
  - Q_ℓ(n−m) for Q_ℓ(m−n) in (7.1.5);
  - #P for #Pⁿ in (8.1);
  - ℱ_{j,0} for ℱ_{1,0} in (8.4.2);
  - u used for two different inclusions in (8.10)–(8.11).
- **E5 is a gap, affecting nothing.** In (5.10), "𝔏 est engendrée par les N_s" does not follow formally for ℓ-adic groups. The proof needs only that 𝔏 contains the Lie algebra they generate, which is irreducible.
- **E15 is a gap, affecting the proof.** In (8.2), the geometric realisation of the Ramanujan eigenvalues is proved (Bourbaki 355) only under restrictive hypotheses. The general case is dismissed with "n'est pas beaucoup plus difficile". The theorem itself is true and was later fully established.
- **E7 is already corrected in print.** The translation (footnote 32) corrects it. The other fourteen are new as far as I could find.
- **Rejected candidates (nine).** Two were translator's claims:
  - the translator's footnote 17 on (5.1) is a scan artefact;
  - the translator's footnote 51 on (8.11) is itself wrong, since H^i_c(A, ℱ_j) is correct as printed.

  Four were abuses or conventions:
  - writing ℱ for ℱ₀ in (3.2) and in the local factors;
  - the "≠ 1" in (6.7), where the integers are nonnegative;
  - a grammatical apposition in (2.5).

  Three were terse but standard steps:
  - the Zariski density in (3.7);
  - H²_c = 0 in (3.8);
  - the uncited complete-intersection cohomology in (8.1).

## Prerequisites the atlas does not cover

- **Grothendieck, Bourbaki 279 (1964), and SGA 5.** The source of the trace formula and L-function formalism that the atlas now imports from an unstaged upstream supplier.
- **SGA 7 I–II.** Lefschetz pencils, Picard–Lefschetz, and the cohomology of complete intersections.
- **Deligne, Bourbaki 355 (1969).** The input to (8.2).
- **Rankin (1939).** Rankin's method.
- **Raynaud, Bourbaki 286 (1965).** The Grothendieck–Ogg–Shafarevich formula.
- **Serre, "Corps locaux à corps résiduel algébriquement clos" (1961).** The Artin–Schreier conductor.
- **Weil (1949).** The conjectures.

Kazhdan–Margulis is cited in (5.10) by name only, and LPV.5 plans the ℓ-adic openness argument itself.
